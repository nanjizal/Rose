package rose;
import rose.PiTo2pi;

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
        this = { radius: r, theta: (t: PiTo2pi ) };
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
		return "cartX:" + cartX + " cartY:" + cartY + " radius:" + this.radius + " theta:" + this.theta;
	}
}
