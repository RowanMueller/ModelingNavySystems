import { motion } from "framer-motion";

export default function Loading() {
  return (
    <div className="flex h-screen w-full items-center justify-center">
      <motion.div
        className="flex space-x-2"
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        transition={{ repeat: Infinity, duration: 1.5 }}
      >
        {[...Array(3)].map((_, i) => (
          <motion.div
            key={i}
            className="h-6 w-6 rounded-full bg-blue-500"
            animate={{
              scale: [1, 1.5, 1],
              opacity: [0.5, 1, 0.5],
            }}
            transition={{
              repeat: Infinity,
              duration: 1,
              delay: i * 0.2,
            }}
          />
        ))}
      </motion.div>
    </div>
  );
}
