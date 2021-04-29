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

void loadImages(){
    //player
    playerImage = loadImage("images\\data\\player\\playerTWOdown.png");
    
    //basic enemy
    basicEnemy1Image = loadImage("images\\data\\enemy\\basic\\enemyONE.png");
    basicEnemy2Image = loadImage("images\\data\\enemy\\basic\\enemyTWO.png");
    basicEnemy3Image = loadImage("images\\data\\enemy\\basic\\enemyTHREE.png");
    //medium enemy
    mediumEnemy1Image = loadImage("images\\data\\enemy\\medium\\enemyONE.png");
    mediumEnemy2Image = loadImage("images\\data\\enemy\\medium\\enemyTWO.png");
    mediumEnemy3Image = loadImage("images\\data\\enemy\\medium\\enemyTHREE.png");
    mediumEnemy4Image = loadImage("images\\data\\enemy\\medium\\enemyFOUR.png");
    //boss enemy
    bossEnemy1Image = loadImage("images\\data\\enemy\\boss\\enemyONE.png");
    bossEnemy2Image = loadImage("images\\data\\enemy\\boss\\enemyTWO.png");
    bossEnemy3Image = loadImage("images\\data\\enemy\\boss\\enemyTHREE.png");
    bossEnemy4Image = loadImage("images\\data\\enemy\\boss\\enemyFOUR.png");
    
    //guns
    basicWeapon1Image = loadImage("images\\data\\weapon\\basic\\weaponONE.png");
    basicWeapon2Image = loadImage("images\\data\\weapon\\basic\\weaponTWO.png");
    basicWeapon3Image = loadImage("images\\data\\weapon\\basic\\weaponTHREE.png");
    basicWeapon4Image = loadImage("images\\data\\weapon\\basic\\weaponFOUR.png");
    mediumWeapon1Image = loadImage("images\\data\\weapon\\medium\\weaponONEmed.png");
    mediumWeapon2Image = loadImage("images\\data\\weapon\\medium\\weaponTWOmed.png");
    mediumWeapon3Image = loadImage("images\\data\\weapon\\medium\\weaponTHREEmed.png");
    ultimateWeaponImage = loadImage("images\\data\\weapon\\Ultimate\\weaponONE.png");
    
    basicAmmo1Image = loadImage("images\\data\\weapon\\ammo\\ammoONEbas.png");
    mediumAmmo1Image= loadImage("images\\data\\weapon\\ammo\\ammoONEmed.png");
    basicAmmo2Image = loadImage("images\\data\\weapon\\ammo\\ammoTWOmed.png");
    basicAmmo3Image = loadImage("images\\data\\weapon\\ammo\\ammoTHREEbas.png");
    
    mediumShrapnel1Image =   loadImage("images\\data\\weapon\\shrapnel\\shrapnelONEblueMED.png");
    mediumShrapnel2Image =   loadImage("images\\data\\weapon\\shrapnel\\shrapnelONEgreenMED.png");
    mediumShrapnel3Image =   loadImage("images\\data\\weapon\\shrapnel\\shrapnelONEredMED.png");
    mediumShrapnel4Image =   loadImage("images\\data\\weapon\\shrapnel\\shrapnelONEyellowMED.png");
    ultimateShrapnel1Image = loadImage("images\\data\\weapon\\shrapnel\\shrapnelONEblueULT.png");
    ultimateShrapnel2Image = loadImage("images\\data\\weapon\\shrapnel\\shrapnelONEredULT.png");
    ultimateShrapnel3Image = loadImage("images\\data\\weapon\\shrapnel\\shrapnelONEyellowULT.png");
    
    //boss enemy
    petImage = loadImage("images\\data\\pet\\petFIVEleft1.png");
    
    //other
    bulletImage = loadImage("images\\data\\weapon\\ammo\\ammoTWOmed.png");
    petImage1 = loadImage("images\\data\\pet\\petFIVEsitting.png");
}