(
var w, u;

var rotX = 0.3;
var rotY = 0.4;
var rotZ = 0.1;

var points = Array.fill(300, {

    Spherical(
        rrand(20.0, 150.0),
        rrand(-pi, pi),
        rrand(-pi/2, pi/2)
    ).asCartesian

});

w = Window("Cartesian Plotter", Rect(100,100,600,600));

u = UserView(w, w.view.bounds)
.background_(Color.black);

u.drawFunc = {

    var d = 400;

    Pen.translate(300,300);

    points.do { |p|

        var x,y,z;
        var x1,y1,z1;
        var x2,y2,z2;
        var scale;

        x = p.x;
        y = p.y;
        z = p.z;

        // Z-axis rotation

        x1 = x * rotZ.cos - y * rotZ.sin;
        y1 = x * rotZ.sin + y * rotZ.cos;
        z1 = z;

        // Y-axis rotation

        x2 = x1 * rotY.cos + z1 * rotY.sin;
        z2 = x1.neg * rotY.sin + z1 * rotY.cos;
        y2 = y1;

        // X-axis rotation

        x1 = x2;
        y1 = y2 * rotX.cos - z2 * rotX.sin;
        z1 = y2 * rotX.sin + z2 * rotX.cos;

        scale = d / (d + z1 + 300);

        Pen.fillColor = Color.white.alpha_(scale.clip(0.2,1));

        Pen.fillOval(
            Rect.aboutPoint(
                Point(
                    x1 * scale,
                    y1 * scale
                ),
                4 * scale,
                4 * scale
            )
        );

    };

};

w.front;
)

(
var w, u;

var rotAz = 0.0;
var rotEl = 0.0;

var points;

points = Array.fill(500, {

    Spherical(
        rrand(30.0,150.0),      // radius
        rrand(-pi,pi),          // azimuth
        rrand(-pi/2,pi/2)       // elevation
    )

});

w = Window("Spherical Plotter", Rect(100,100,600,600));

u = UserView(w, w.view.bounds)
.background_(Color.black);

u.drawFunc = {

    var d = 500;

    Pen.translate(
        u.bounds.width/2,
        u.bounds.height/2
    );

    points.do { |s|

        var p;
        var scale;

        p = Spherical(
            s.rho,
            s.theta + rotAz,
            (s.phi + rotEl).clip(
                -pi/2,
                pi/2
            )
        ).asCartesian;

        scale = d / (d + p.z + 250);

        Pen.fillColor =
        Color.white.alpha_(
            scale.clip(0.1,1.0)
        );

        Pen.fillOval(
            Rect.aboutPoint(
                Point(
                    p.x * scale,
                    p.y * scale
                ),
                3 * scale,
                3 * scale
            )
        );

    };

};

w.front;

Routine({

    inf.do {

        rotAz = rotAz + 0.01;
        rotEl = rotEl + 0.002;

        {
            u.refresh
        }.defer;

        0.02.wait;

    };

}).play;

)