from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):
    dependencies = [
        ("rest", "0003_device_ip_online"),
    ]

    operations = [
        migrations.CreateModel(
            name="TelemetrySession",
            fields=[
                ("id", models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name="ID")),
                ("Name", models.CharField(default="Telemetry Session", max_length=200)),
                ("StartedAt", models.DateTimeField(auto_now_add=True)),
                ("EndedAt", models.DateTimeField(blank=True, null=True)),
                ("IsActive", models.BooleanField(default=True)),
                ("System", models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name="telemetry_sessions", to="rest.system")),
                ("User", models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name="telemetry_sessions", to="auth.user")),
            ],
        ),
        migrations.CreateModel(
            name="TelemetrySample",
            fields=[
                ("id", models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name="ID")),
                ("Timestamp", models.DateTimeField()),
                ("Latitude", models.FloatField(blank=True, null=True)),
                ("Longitude", models.FloatField(blank=True, null=True)),
                ("AltitudeM", models.FloatField(blank=True, null=True)),
                ("VelocityXMps", models.FloatField(blank=True, null=True)),
                ("VelocityYMps", models.FloatField(blank=True, null=True)),
                ("VelocityZMps", models.FloatField(blank=True, null=True)),
                ("RollDeg", models.FloatField(blank=True, null=True)),
                ("PitchDeg", models.FloatField(blank=True, null=True)),
                ("YawDeg", models.FloatField(blank=True, null=True)),
                ("BatteryPct", models.FloatField(blank=True, null=True)),
                ("Extra", models.JSONField(blank=True, null=True)),
                ("Session", models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name="samples", to="rest.telemetrysession")),
            ],
        ),
    ]
