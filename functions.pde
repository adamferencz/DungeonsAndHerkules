void startWave() {
switch(level) {
        case 1 : 
        spawners.add(new PalmSpawner());
        break;
        case 2 : 
        spawners.add(new PalmSpawner());
        spawners.add(new PalmSpawner());
        break;
        case 3 : 
        spawners.add(new TreeHouseSpawner());
        spawners.add(new TreeHouseSpawner());
        break;
        case 4 : 
        spawners.add(new Swamp());
        spawners.add(new Swamp());
        spawners.add(new Swamp());
        break;
        case 5 : 
        spawners.add(new PalmSpawner());
        spawners.add(new TreeHouseSpawner());
        spawners.add(new Swamp());
        
        break;
        case 6 :
        spawners.add(new LittleHole());
        default:
        createSpawners();
        break;
    }
}

void createSpawners() {
  int levelM = level-2;
  int p = round(levelM/7);
  int t = round(levelM/6);
  int s = round((levelM+2)/6);
  int h = round(levelM/5);
  int l = round((levelM+2)/10);

  for (int i = 0; i < p; i++) {
    spawners.add(new PalmSpawner());
  }

  for (int i = 0; i < t; i++) {
    spawners.add(new TreeHouseSpawner());
  }

  for (int i = 0; i < s; i++) {
    spawners.add(new Swamp());
  }

  for (int i = 0; i < h; i++) {
    spawners.add(new Hole());
  }

  for (int i = 0; i < l; i++) {
    spawners.add(new LittleHole());
  }
}

void loadImages(){
    //player
    playerImage = loadImage("images\\data\\player\\playerTWOdown.png");
    player1Image = loadImage("images\\data\\player\\playerONEdown.png");
    player3Image = loadImage("images\\data\\player\\playerTHREEdown.png");
    playerImageH = loadImage("images\\data\\player\\playerTWOdownRED.png");
    player1ImageH = loadImage("images\\data\\player\\playerONEdownRED.png");
    player3ImageH = loadImage("images\\data\\player\\playerTHREEdownRED.png");
    
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
    // mediumWeapon3Image = loadImage("images\\data\\weapon\\medium\\weaponTHREEmed.png");
    mediumWeapon4Image = loadImage("images\\data\\weapon\\medium\\weaponFOURmed.png");
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
    


    //spawners
    basicSpawner1Image  =   loadImage("images\\data\\spawners\\spawnerBasicONE.png");
    basicSpawner2Image  =   loadImage("images\\data\\spawners\\spawnerBasicTWO.png");
    basicSpawner3Image  =   loadImage("images\\data\\spawners\\spawnerBasicTHREE.png");
    mediumSpawner1Image =   loadImage("images\\data\\spawners\\spawnerMediumONE.png");
    mediumSpawner2Image =   loadImage("images\\data\\spawners\\spawnerMediumTWO.png");
    mediumSpawner3Image =   loadImage("images\\data\\spawners\\spawnerMediumTHREE.png");
    mediumSpawner4Image =   loadImage("images\\data\\spawners\\spawnerMediumFOUR.png");



    //other
    bulletImage = loadImage("images\\data\\weapon\\ammo\\ammoTWOmed.png");
    petImage1 = loadImage("images\\data\\pet\\petFIVEsitting.png");

    //items
    heal = loadImage("images\\data\\ui\\bigheal.png");
    shield = loadImage("images\\data\\ui\\bigshield.png");
    effect = loadImage("images\\data\\ui\\effectheal.png");
}