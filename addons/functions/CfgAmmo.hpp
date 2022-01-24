class CfgAmmo {
    class ShellBase;
    class GVAR(explosion): ShellBase {
        hit = 500;
        indirectHit = 500;
        indirectHitRange = 1;
        typicalSpeed = 100;
        explosive = 1;
        cost = 300;
        model = "\A3\Weapons_f\empty";
        airFriction = 0;
        timeToLive = 1;
        explosionTime = 0.001;
        soundFly[] = {"", 1, 1};
        soundEngine[] = {"", 1, 4};
        explosionEffects = QGVAR(ExplosionEffects);
        SoundSetExplosion[] = {"SmallIED_Exp_SoundSet", "SmallIED_Tail_SoundSet"};
    };
};

class GVAR(ExplosionEffects) {
    class LightExp
    {
        simulation = "light";
        type = "ExploLight";
        position[] = {0, 1.5, 0};
        intensity = 0.001;
        interval = 1;
        lifeTime = 0.5;
    };
    class Explosion1
    {
        simulation = "particles";
        type = "ExplosionParticles";
        position[] = {0, 0, 0};
        intensity = 3;
        interval = 1;
        lifeTime = 0.25;
    };
    class SmallSmoke1
    {
        simulation = "particles";
        type = "CloudMedDark";
        position[] = {0, 0, 0};
        intensity = 1;
        interval = 1;
        lifeTime = 1;
    };
};