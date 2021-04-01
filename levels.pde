void startWave() {
    switch(level) {
        case 1 : 
        spawners.add(new Spawner(1));
        break;
        case 2 : 
        spawners.add(new Spawner(1));
        spawners.add(new Spawner(1));
        break;
        default:
        spawners.add(new Spawner(1));
        spawners.add(new Spawner(1));
        break;
    }
}

