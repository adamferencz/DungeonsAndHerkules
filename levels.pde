void startWave() {
    switch(level) {
        case 1 : 
        spawners.add(new Spawner(1));
        break;
        case 2 : 
        spawners.add(new Spawner(2));
        break;
        case 3 : 
        spawners.add(new Spawner(3));
        break;
        case 4 : 
        spawners.add(new Spawner(4));
        break;
        case 5 : 
        spawners.add(new Spawner(2));
        spawners.add(new Spawner(3));
        break;
        default:
        spawners.add(new Spawner(1));
        spawners.add(new Spawner(1));
        break;
    }
}