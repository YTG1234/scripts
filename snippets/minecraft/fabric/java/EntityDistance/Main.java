List<Entity> entities = (world.getEntitiesByType(null, (entity) -> new NumberRange.FloatRange(0.0F, 3.0F).testSqrt(entity.squaredDistanceTo(new Vec3d(getBlockPos().getX(), getBlockPos().getY(), getBlockPos().getZ()))));
for (Entity entity : entities) {
    if (entity instanceof HostileEntity) {
        doThing();
    }
}
