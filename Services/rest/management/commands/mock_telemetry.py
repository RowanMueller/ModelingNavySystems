import random
import time
from datetime import datetime, timezone

from django.core.management.base import BaseCommand
from django.contrib.auth.models import User

from Services.rest.models import System, TelemetrySession, TelemetrySample


class Command(BaseCommand):
    help = "Generate mock telemetry samples for a session."

    def add_arguments(self, parser):
        parser.add_argument("--session-id", type=int, help="Existing session id to append to")
        parser.add_argument("--system-id", type=int, help="System id to attach new session to")
        parser.add_argument("--user-id", type=int, help="User id for session ownership")
        parser.add_argument("--hz", type=float, default=1.0, help="Sample rate in Hz")

    def handle(self, *args, **options):
        session_id = options.get("session_id")
        system_id = options.get("system_id")
        user_id = options.get("user_id")
        hz = options.get("hz") or 1.0
        delay = 1.0 / hz if hz > 0 else 1.0

        session = None
        if session_id:
            try:
                session = TelemetrySession.objects.get(id=session_id)
            except TelemetrySession.DoesNotExist:
                self.stderr.write(self.style.ERROR("Session not found."))
                return

        if not session:
            user = None
            if user_id:
                user = User.objects.filter(id=user_id).first()
            if not user:
                user = User.objects.first()
            if not user:
                self.stderr.write(self.style.ERROR("No users found. Create a user first."))
                return

            if system_id:
                system = System.objects.filter(id=system_id, User=user).first()
            else:
                system = System.objects.filter(User=user).first()
            if not system:
                self.stderr.write(self.style.ERROR("No system found for user."))
                return

            session = TelemetrySession.objects.create(
                System=system,
                User=user,
                Name="Mock Telemetry Session",
                IsActive=True,
            )

        self.stdout.write(self.style.SUCCESS(f"Streaming mock telemetry to session {session.id}"))
        base_lat = 37.7749
        base_lon = -122.4194
        t = 0.0
        try:
            while True:
                lat = base_lat + (random.random() - 0.5) * 0.001
                lon = base_lon + (random.random() - 0.5) * 0.001
                altitude = 10 + 2 * random.random()
                vx = 1.5 + 0.3 * random.random()
                vy = 0.5 * random.random()
                vz = 0.1 * random.random()
                roll = 2.0 * random.random()
                pitch = 1.5 * random.random()
                yaw = (t * 5) % 360
                battery = max(0.0, 100.0 - t * 0.02)

                TelemetrySample.objects.create(
                    Session=session,
                    Timestamp=datetime.now(timezone.utc),
                    Latitude=lat,
                    Longitude=lon,
                    AltitudeM=altitude,
                    VelocityXMps=vx,
                    VelocityYMps=vy,
                    VelocityZMps=vz,
                    RollDeg=roll,
                    PitchDeg=pitch,
                    YawDeg=yaw,
                    BatteryPct=battery,
                )
                t += delay
                time.sleep(delay)
        except KeyboardInterrupt:
            session.IsActive = False
            session.save()
            self.stdout.write(self.style.WARNING("Stopped mock telemetry."))
