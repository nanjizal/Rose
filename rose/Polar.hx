package rose;
import rose.PiTo2pi;
import rose.TauRadian;
@:initStuct
class Polar_ {
    public var radius: Float;
    public var theta:  PiTo2pi;
    public inline
    function new( radius: Float, theta: PiTo2pi ){
        this.radius = radius;
        this.theta = theta;
    }
}

@:transitive
@:forward
abstract Polar( Polar_ ) from Polar_ to Polar_ {
    public inline
    function new( r: Float, t: Float ){
        if( r < 0 ){
            t = theta-Math.PI;
            r = -r;
        }
        this = { radius: r, theta: (t: PiTo2pi ) };
    }
    public var phase( get, set ): Float;
    inline function get_phase(): Float {
        var f: Float = this.theta;
        return f;
    }
    inline function set_phase( phi: Float ): Float {
        this.theta = tauLimit( phi, 0 );
        var f: Float = theta;
        return f;
    }
    public var magnitude( get, set ): Float;
    inline function get_magnitude(): Float {
        return this.radius;
    }
    inline function set_magnitude( mag: Float ): Float {
        if( mag < 0 ){
            phase = this.theta-Math.PI;
            mag = -mag;
        }
        this.radius = mag;
        return mag;
    }
    public var cartX( get, never ): Float;
    inline function get_cartX(): Float {
        return r*Math.cos( theta );
    }
    public var cartY( get, never ): Float;
    inline function get_cartY(): Float {
        return r*Math.sin( theta );
    }
    public static inline
    function fromCartesian( x: Number, y: Number ): Polar {
		this = new Polar( Math.sqrt( (x * x) + (y * y)
                        , ( x < 0 )? ( Math.atan( y / x) - Math.PI ): ( Math.atan( y / x ) );
	}
    @:keep
    public inline
    function toString(): String {
		return "cartX:" + cartX + " cartY:" + cartY + " magnitude:" + this.radius + " phase:" + this.theta;
	}
}
