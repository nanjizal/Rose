package rose;
import rose.Polar;
/** 
   { r, i }
**/
@:structInit
class ComplexNum_ {
    public var r = 0.; 
    public var i = 0.;
    function new( r: Float, i: Float ){
        this.r = r; 
        this.i = i;
    }
    @:keep
    @:to
    public inline
    function toString(){
        return r + ' ' + i;
    }
    public function clone(): ComplexNum_ {
        return { r: this.r, i: this.i };
    }
}
/**
   Complex - A Complex Float Type.  
   { r, i }
   
   For Convinence you can declare in several ways eg:  
   var c0: Complex = '1 + 2i';  
   var c1: Complex = { real: 1., imaginary: 2. };  
   var c2: Complex = { r: 1., i: 2. };  
   var c3: Complex = new Complex({ r: 1., i: 2. });  
   
   You can use normal operations  
   var c4 = c0 * c1;  
   var c5 = c0 + c1;  
   
   You can extract either part  
   var real = c0.real;  
   var imaginary = c0.i;  
   
   You can trace it.
   trace( Complex.fromString( c0 ) ); // '1. + 2. i'
   
   Trig functions are contained in geom.curve.ComplexTrig, but do not have tests beyond compile.  
  
**/
@:transient
@:forward
abstract ComplexNum( ComplexNum_ ) from ComplexNum_ to ComplexNum_ {
    /**
     * <pre><code>
     * >>> ({ 
     * ... var c0: Complex = '1 + 2i';
     * ... var c1 = new Complex({ r: 1., i: 2. });
     * ... c1 == c0; }) == true
     * </code></pre>
     */
    @:from
    static public inline
    function fromString( s: String ): Complex {
        var removeI = s.substr(0,s.length-1);
        var split = removeI.split('+');
        var c = Complex.zero;
        c.real = Std.parseFloat( split[0] );
        c.i = Std.parseFloat( split[1] );
        return c;
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var c0: Complex = { real: 1., imaginary: 2. };
     * ... var c1 = new Complex({ x: 1., y: 2. });
     * ... c1 == c0; }) == true
     * </code></pre>
     */
    @:from
    static public inline
    function fromRealImaginary( c:{ real: Float, imaginary: Float } ): Complex {
        return new Complex({ r: c.real, i: c.imaginary });
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var c0: Complex = { r: 1., i: 2. };
     * ... var c1 = new Complex({ r: 1., i: 2. });
     * ... c1 == c0; }) == true
     * </code></pre>
     */
    @:from
    static public inline
    function fromRi( c:{ r: Float, i: Float } ): Complex {
        return new Complex({ r: c.r, i: c.i });
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var c0: Complex = { real: 1., i: 2. };
     * ... var c1 = new Complex({ r: 1., i: 2. });
     * ... c1 == c0; }) == true
     * </code></pre>
     */
    @:from
    static public inline
    function fromRealI( c:{ real: Float, i: Float } ): Complex {
        return new Complex({ r: c.real, i: c.i });
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var c: Complex = { r: 1., i: 2. };
     * ... var s: String = c;
     * ... // js seems to remove the .'s from the numbers not sure on other targets
     * ... s == '1. + 2. i' || s == '1 + 2 i'; }) == true
     * </code></pre>
     */
    @:to
    public inline
    function toString(): String{
        var r: Float = real;
        var i: Float = i;
        return '$r + $i i'; 
    }
    public inline
    function new( m: ComplexNum_ ){ this = m; }
    /** 
     * <pre><code>
     * >>> ({
     * ... Complex.zero == new Complex({r:0.
     * ...                            , i:0.}); 
     * ... }) == true
     * </code></pre>
     */
    public static var zero( get, null ): Complex;
    static inline
    function get_zero(): Complex {
        return new Complex( { r: 0., i: 0. } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... Complex.one == new Complex({x:1.
     * ...                           , y:0.}); 
     * ... }) == true
     * </code></pre>
     */
    public static var one( get, null ): Complex;
    static inline
    function get_one(): Complex {
        return new Complex( { r: 1., i: 0. } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... Complex.minus1 == new Complex({r: -1.
     * ...                              , i: 0.}); 
     * ... }) == true
     * </code></pre>
     */
    public static var minus1( get, null ): Complex;
    static inline
    function get_minus1(): Complex {
        return new Complex( { r: -1., i: 0. } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... Complex.unit == new Complex({x: 1.
     * ...                            , y: 1.}); 
     * ... }) == true
     * </code></pre>
     */
    public static var unit( get, null ): Complex;
    static inline
    function get_unit(): Complex {
        return new Complex( { r: 1., i: 1. } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... Complex.i1 == new Complex({r: 0.
     * ...                          , i: 1.}); 
     * ... }) == true
     * </code></pre>
     */
    public static var i1( get, null ): Complex;
    static inline
    function get_i1(): Complex {
        return new Complex( { r: 0., i: 1. } );
    }    
    /** 
     * <pre><code>
     * >>> ({
     * ... Complex.iMinus1 == new Complex({r: 0.
     * ...                               , i: -1.}); 
     * ... }) == true
     * </code></pre>
     */
    public static var iMinus1( get, null ): Complex;
    static inline
    function get_iMinus1(): Complex {
        return new Complex( { r: 0., i: -1. } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... Complex.minusUnit == new Complex({r: -1.
     * ...                                 , i: -1.}); 
     * ... }) == true
     * </code></pre>
     */
    public static var minusUnit( get, null ): Complex;
    static inline
    function get_minusUnit(): Complex {
        return new Complex( { r: -1., i: -1. } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... Complex.unitInfinity == new Complex({r:Math.POSITIVE_INFINITY
     * ...                                    , i:Math.POSITIVE_INFINITY}); 
     * ... }) == true
     * </code></pre>
     */
    public static var unitInfinity( get, null ): Complex;
    static inline
    function get_unitInfinity(): Complex {
        return new Complex( { r: Math.POSITIVE_INFINITY, i: Math.POSITIVE_INFINITY } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... Complex.unitMinusInfinity == new Complex({x:Math.NEGATIVE_INFINITY
     * ...                                         , y:Math.NEGATIVE_INFINITY}); 
     * ... }) == true
     */
    public static var unitMinusInfinity( get, null ): Complex;
    static inline
    function get_unitMinusInfinity(): Complex {
        return new Complex( { r: Math.NEGATIVE_INFINITY, i: Math.NEGATIVE_INFINITY} );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... Complex.realInfinity == new Complex({r:Math.POSITIVE_INFINITY
     * ...                                    , i:0.}); 
     * ... }) == true
     * </code></pre>
     */
    public static var realInfinity( get, null ): Complex;
    static inline
    function get_realInfinity(): Complex {
        return new Complex( { r: Math.POSITIVE_INFINITY, i:  0. } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... Complex.minusInfinity == new Complex({x:Math.NEGATIVE_INFINITY
     * ...                                         , y:0.}); 
     * ... }) == true
     * </code></pre>
     */
    public static var minusInfinity( get, null ): Complex;
    static inline
    function get_minusInfinity(): Complex {
        return new Complex( { r: Math.NEGATIVE_INFINITY, i:  0. } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... Complex.iInfinity == new Complex({r:0.
     * ...                                 , i:Math.POSITIVE_INFINITY}); 
     * ... }) == true
     * </code></pre>
     */
    public static var iInfinity( get, null ): Complex;
    static inline
    function get_iInfinity(): Complex {
        return new Complex( { r: 0., i:  Math.POSITIVE_INFINITY } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... Complex.iMinusInfinity == new Complex({r:0.
     * ...                                      , i:Math.NEGATIVE_INFINITY}); 
     * ... }) == true
     * </code></pre>
     */
    public static var iMinusInfinity( get, null ): Complex;
    static inline
    function get_iMinusInfinity(): Complex {
        return new Complex( { r: 0., i:  Math.NEGATIVE_INFINITY } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... Complex.posNegInfinity == new Complex({r:Math.POSITIVE_INFINITY
     * ...                                      , i:Math.NEGATIVE_INFINITY}); 
     * ... }) == true
     * </code></pre>
     */
    public static var posNegInfinity( get, null ): Complex;
    static inline
    function get_posNegInfinity(): Complex {
        return new Complex( { r: Math.POSITIVE_INFINITY, i:  Math.NEGATIVE_INFINITY } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... Complex.negPosInfinity == new Complex({r:Math.NEGATIVE_INFINITY
     * ...                                      , i:Math.POSITIVE_INFINITY}); 
     * ... }) == true
     * </code></pre>
     */
    public static var negPosInfinity( get, null ): Complex;
    static inline
    function get_negPosInfinity(): Complex {
        return new Complex( { r: Math.NEGATIVE_INFINITY, i:  Math.POSITIVE_INFINITY } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... Complex.realPi == new Complex({r:(Math.PI)
     * ...                               , i:0.}); 
     * ... }) == true
     * </code></pre>
     */
    public static var realPi( get, null ): Complex;
    static inline
    function get_realPi(): Complex {
        return new Complex( { r: (Math.PI), i: 0. } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... Complex.iPi == new Complex({r:0.
     * ...                            , i:(Math.PI)}); 
     * ... }) == true
     * </code></pre>
     */
    public static var iPi( get, null ): Complex;
    static inline
    function get_iPi(): Complex {
        return new Complex( { r: 0., i: (Math.PI) } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... Complex.unitPi == new Complex({r:(Math.PI)
     * ...                               , i:(Math.PI)}); 
     * ... }) == true
     * </code></pre>
     */
    public static var unitPi( get, null ): Complex;
    static inline
    function get_unitPi(): Complex {
        return new Complex( { r: (Math.PI), i: (Math.PI) } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... Complex.unitMinusPi == new Complex({r:(-Math.PI)
     * ...                                    , i:(-Math.PI)}); 
     * ... }) == true
     * </code></pre>
     */
    public static var unitMinusPi( get, null ): Complex;
    static inline
    function get_unitMinusPi(): Complex {
        return new Complex( { r: (-Math.PI), i: (-Math.PI) } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... Complex.iMinusPi == new Complex({r:0.
     * ...                                 , i:(-Math.PI)}); 
     * ... }) == true
     * </code></pre>
     */
    public static var iMinusPi( get, null ): Complex;
    static inline
    function get_iMinusPi(): Complex {
        return new Complex( { r: 0., i: (-Math.PI) } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... Complex.minusPi == new Complex({r:(-Math.PI)
     * ...                                , i:0.}); 
     * ... }) == true
     * </code></pre>
     */
    public static var minusPi( get, null ): Complex;
    static inline
    function get_minusPi(): Complex {
        return new Complex( { r: (-Math.PI), i: 0. } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... Complex.posNegPi == new Complex({x:(Math.PI)
     * ...                                , y:(-Math.PI)}); 
     * ... }) == true
     * </code></pre>
     */
    public static var posNegPi( get, null ): Complex;
    static inline
    function get_posNegPi(): Complex {
        return new Complex( { r: (Math.PI), i: (-Math.PI) } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... Complex.negPosPi == new Complex({r:(-Math.PI)
     * ...                                 , i:(Math.PI)}); 
     * ... }) == true
     * </code></pre>
     */
    public static var negPosPi( get, null ): Complex;
    static inline
    function get_negPosPi(): Complex {
        return new Complex( { r: (-Math.PI), i: (Math.PI) } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... Complex.realTau == new Complex({r:(Math.PI*2)
     * ...                               , i:0.}); 
     * ... }) == true
     * </code></pre>
     */
    public static var realTau( get, null ): Complex;
    static inline
    function get_realTau(): Complex {
        return new Complex( { r: (Math.PI*2), i: 0. } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... Complex.iTau == new Complex({r:0.
     * ...                            , i:(Math.PI*2)}); 
     * ... }) == true
     * </code></pre>
     */
    public static var iTau( get, null ): Complex;
    static inline
    function get_iTau(): Complex {
        return new Complex( { r: 0., i: (Math.PI*2) } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... Complex.unitTau == new Complex({r:(Math.PI*2)
     * ...                               , i:(Math.PI*2)}); 
     * ... }) == true
     * </code></pre>
     */
    public static var unitTau( get, null ): Complex;
    static inline
    function get_unitTau(): Complex {
        return new Complex( { r: (Math.PI*2), i: (Math.PI*2) } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... Complex.unitMinusTau == new Complex({r:(-Math.PI*2)
     * ...                                    , i:(-Math.PI*2)}); 
     * ... }) == true
     * </code></pre>
     */
    public static var unitMinusTau( get, null ): Complex;
    static inline
    function get_unitMinusTau(): Complex {
        return new Complex( { r: (-Math.PI*2), i: (-Math.PI*2) } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... Complex.iMinusTau == new Complex({r:0.
     * ...                                 , i:(-Math.PI*2)}); 
     * ... }) == true
     * </code></pre>
     */
    public static var iMinusTau( get, null ): Complex;
    static inline
    function get_iMinusTau(): Complex {
        return new Complex( { r: 0., i: (-Math.PI*2) } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... Complex.minusTau == new Complex({r:(-Math.PI*2)
     * ...                                , i:0.}); 
     * ... }) == true
     * </code></pre>
     */
    public static var minusTau( get, null ): Complex;
    static inline
    function get_minusTau(): Complex {
        return new Complex( { r: (-Math.PI*2), i: 0. } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... Complex.posNegTau == new Complex({r:(Math.PI*2)
     * ...                                 , i:(-Math.PI*2)}); 
     * ... }) == true
     * </code></pre>
     */
    public static var posNegTau( get, null ): Complex;
    static inline
    function get_posNegTau(): Complex {
        return new Complex( { r: (Math.PI*2), i: (-Math.PI*2) } );
    }
    /** 
     * <pre><code>
     * >>> ({
     * ... Complex.negPosTau == new Complex({x:(-Math.PI*2)
     * ...                                 , y:(Math.PI*2)}); 
     * ... }) == true
     * </code></pre>
     */
    public static var negPosTau( get, null ): Complex;
    static inline
    function get_negPosTau(): Complex {
        return new Complex( { r: (-Math.PI*2), i: (Math.PI*2) } );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new Complex({ r: 1., i: 2. });
     * ... a.i == 2.; }) == true
     * </code></pre>
     */
    public var i( get, set ): Float;
    inline
    function get_i(): Float {
       return this.i;
    }
    inline
    function set_i( v: Float ): Float {
        this.i = v;
        return v;
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new Complex({ r: 1., i: 2. });
     * ... a.real == 1.; }) == true
     * </code></pre>
     */
    public var real( get, set ): Float;
    inline function get_real(): Float {
        return this.r;
    }
    inline function set_real( v: Float ): Float {
        this.r = v;
        return v;
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new Complex({ r: 1., i: 2. });
     * ... a.clone() == a; }) == true
     * </code></pre>
     */
    public inline
    function clone():Complex {
        return new Complex( { r: this.r, i: this.i } );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new Complex({ r: 1., i: 2. });
     * ... var b = new Complex({ r: 2., i: 1. });
     * ... a.swap() == b; }) == true
     * </code></pre>
     */
    public inline
    function swap():Complex {
        return new Complex( { r: this.i, i: this.r } );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new Complex({ r: 1., i: 2. });
     * ... var b = new Complex({ r: 1., i: 2. });
     * ... a == b; }) == true
     * </code></pre>
     */
    @:op( A == B ) public static inline
    function equal( a: Complex, b: Complex ): Bool {
        var delta = 0.0000001;
        return !(
               Math.abs(a.r - b.r) >= delta
            || Math.abs(a.i - b.i) >= delta
        );
    }
     /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new Complex({ x: 1., y: 2. });
     * ... var b = new Complex({ x: 1., y: 1. });
     * ... a != b; }) == true
     * </code></pre>
     */
    @:op(A != B) public static inline
    function notEqual( a: Complex, b:Complex ): Bool {
        return !equal( a, b );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = Complex.unit;
     * ... a + a == new Complex({ r: 2., i: 2. }); 
     * ... }) == true
     * </code></pre>
     */
    @:op(A + B) public static inline
    function add( a: Complex, b: Complex ): Complex {
      	return new Complex({ r: a.r + b.r, i: a.i + b.i });
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = Complex.unit;
     * ... a - a == Complex.zero; 
     * ... }) == true
     * </code></pre>
     */
    @:op(A - B) public static inline
    function subtract( a: Complex, b: Complex ): Complex {
        return new Complex({ : a.r - b.r, y: a.i - b.i });
    }
    /* <pre><code>
     * >>> ({ 
     * ... var a = 10.;
     * ... var b = new Complex({ r: 1., i: 7. });
     * ... a * b == new Complex({ r: 10, i: 70. });
     * ... }) == true
     * </code></pre>    
    */    
    @:op(A * B) public static inline
    function scale( a: Float, b: Complex ):Complex {
        return new Complex({ r: a * b.r , y: a * b.i });    
    }     
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new Complex({ r: 3., i: 2. });
     * ... var b = new Complex({ r: 1., i: 7. });
     * ... a * b == new Complex({ r: -11., i: 23. });
     * ... }) == true
     * </code></pre>
     */    
    @:op(A * B) public static inline
    function multiply( a: Complex, b: Complex ):Complex {
        return new Complex({ r: ( a.r * b.r ) - ( a.i * b.i ), i: (a.r * b.i) + (a.i * b.r) });    
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new Complex({ r: 3., i: 2. });
     * ... a.addExponents() == 5;
     * ... }) == true
     * </code></pre>
     */   
    public inline
    function addExponents(){
        return real + i;
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new Complex({ r: 1., i: 2. });
     * ... var b = ~a;
     * ... b == new Complex({ r: 1., i: -2. }); }) == true
     * </code></pre>
     */
    @:op(~A) public static inline
    function conjugate( a: Complex ): Complex {
        return new Complex( { r: a.r, i: -a.i } );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new Complex({ r: 1., i: -3. });
     * ... var b = new Complex({ r: 1., i: 2. });
     * ... a / b == new Complex({ r:-1, i: -1 });
     * ... }) == true
     * </code></pre>
     */
     /* 
    Need to see which approach is fastest.
    @:op(A / B) public static inline
    function divide( c1: Complex, c2: Complex ): Complex {
        // There maybe a more optimal approach using conjugate
        var a = c1.real;
        var b = c1.i;
        var c = c2.real;
        var d = c2.i;
        var real_numr = a*c + b*d;
        var i_numr = b*c - a*d;
        var denominator = c*c + d*d;
        return new Complex( { r: real_numr/denominator, i: i_numr/denominator } );
    }
    */
    @:op(A / B) public static inline
    function divide( c1: Complex, c2: Complex ): Complex {
        var conj = ~c2; 
        var numr = c1 * conj;
        var demr = c2 * conj;    
        var dval = demr.real + demr.i; 
        return new Complex({ r: numr.real/dval, i: numr.i/dval } );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new Complex({ r: 1., i: 2. });
     * ... var b = -a;
     * ... b == new Complex({ r: -1., i: -2. }); }) == true
     * </code></pre>
     */
    @:op(-A) public static inline
    function negate( a: Complex ):Complex {
        return new Complex( { r: -a.r, i: -a.i } );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = new Complex({ r: 2., i: 4. });
     * ... a.magnitudeSquared() == 4. + 16.; }) == true
     * </code></pre>
     */
    public inline 
    function magnitudeSquared(): Float {
        return this.r * this.r + this.i * this.i;
    }
    // 3,4,5 basic pythag triple easy way to test
    /** 
     * <pre><code>
     * >>> ({ 
     * ... var a = new Complex({ r: 3, i: 4});
     * ... a.magnitude == 5.; }) == true
     * </code></pre>
     */
    public var magnitude( get, set ): Float;
    private inline
    function get_magnitude(): Float {
        return Math.sqrt( magnitudeSquared() );
    }
    private inline
    function set_magnitude( length: Float ): Float {
        var currentLength = get_magnitude();
        return if( currentLength == 0. ){ 
            0.;
        } else {
            var mul = length / currentLength;
            this.r *= mul;
            this.i *= mul;
            magnitude;
        }
    }
    public inline
    function phase(): Float {
        return Math.atan2( i, real );
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = Complex.one;
     * ... a.isReal() == true; }) == true
     * </code></pre>
     */
    public inline
    function isReal(): Bool {
        return i == 0;
    }
    /**
     * <pre><code>
     * >>> ({ 
     * ... var a = Complex.i1;
     * ... a.isImaginary() == true; }) == true
     * </code></pre>
     */
    public inline
    function isImaginary(): Bool {
        return real == 0;
    }
    /** 
     * <pre><code>
     * >>> ({ 
     * ... var r = 12;
     * ... var theta = Math.PI/4;
     * ... var cis = Complex.cis;
     * ... var square = Complex.square;
     * ... square(r*cis( theta )) == r*r*cis( 2*theta ); }) == true
     * </code></pre>
     */
    public static inline 
    function cis( angle: Float ): Complex {
       return new Complex({ r: Math.cos( angle ), i: Math.sin( angle ) });
    }
    // TODO: reconsider naming
    /** 
     * <pre><code>
     * >>> ({ 
     * ... var r = 12;
     * ... var theta = Math.PI/4;
     * ... var cis = Complex.cis;
     * ... var square = Complex.square;
     * ... var fromCircle = Complex.fromCircle;
     * ... square(fromCircle(r,theta)) == fromCircle( r*r, 2*theta ); }) == true
     * </code></pre>
     */
    public static inline // ofPolar
    function fromCircle( r: Float , angle: Float ): Complex {
        return r* cis( angle ); 
    }
    /** 
     * <pre><code>
     * >>> ({ 
     * ... var r = 12;
     * ... var theta = Math.PI/4;
     * ... var cis = Complex.cis;
     * ... var square = Complex.square;
     * ... var fromCircle = Complex.fromCircle;
     * ... square(fromCircle(r,theta)) == fromCircle( r*r, 2*theta ); }) == true
     * </code></pre>
     */
    public static inline
    function square( c: Complex ): Complex {
       return if( c.isReal() == true ){
            new Complex({ r: c.real*c.real, i: 0 });
       } else {
            //return magnitude * cis( theta );
            var here = new Complex({ r: c.r, i: c.i });
            here*here;
       }
    }
    // Eulars Formula
    /** 
     * <pre><code>
     * >>> ({ 
     * ... var r = 12;
     * ... var theta = Math.PI/4;
     * ... var cis = Complex.cis;
     * ... var fromCircle = Complex.fromCircle;
     * ... var exp = Complex.exp;
     * ... fromCircle(r,theta) == r*exp( new Complex({ r: 0, i: theta }) ); }) == true
     * </code></pre>
     */
    public static inline
    function exp( c: Complex ): Complex {
       return if( c.isReal() == true ){
            new Complex({ r: Math.exp( c.real ), i: 0 });
       } else {
            new Complex({ r: Math.exp(c.real) * Math.cos(c.i), i:Math.exp(c.real) * Math.sin(c.i) });
       }
    }
    /** 
     * <pre><code>
     * >>> ({ 
     * ... var a = new Complex({ r: 3, i: 4});
     * ... var b = new Complex({ r: 6, i: 8});
     * ... var ln = Complex.ln;
     * ... ln( a*b ) == ln( a ) + ln( b ); }) == true
     * </code></pre>
     */
    public static inline
    function ln( c: Complex ): Complex {
        return if( c.isReal() == true ){
            new Complex({ r: Math.log( c.real ), i: 0 });
        } else {
            new Complex({ r: 0.5*Math.log( c.magnitudeSquared() ), i: arg( c ) });
        }
    }
    // see phase?
    /** 
     * <pre><code>
     * >>> ({ 
     * ... var a = new Complex({ r: 3, i: 4});
     * ... var b = new Complex({ r: 6, i: 8});
     * ... var arg = Complex.arg;
     * ... arg( a*b ) == arg( a ) + arg( b ); }) == true
     * </code></pre>
     */
    public static inline
    function arg( c: Complex ): Float {
        return if( c.real > 0. ){
            Math.atan( c.i/c.real );
        } else if( c.real < 0. && c.i >= 0. ){
            Math.atan( c.i/c.real ) + Math.PI;
        } else if( c.real < 0. && c.i < 0. ){
            Math.atan( c.i/c.real ) - Math.PI;
        } else if( c.real == 0. && c.i > 0. ){
            Math.PI/2;
        } else if( c.real == 0. && c.i < 0. ){
            -Math.PI/2;
        } else {
            throw 'Complex.zero does not have arg?';
        }
    }
    
    public inline
    function reciprocal() {
        var scale = real*real + i*i;
        return new Complex({ r: real / scale, i: -i / scale });
    }
    // pow using DeMoivre's Theorem
    public static inline
    function pow( c: Complex, n: Float ): Complex {
        return if( c.isReal() == true ){
            new Complex({r: Math.pow( c.real, n ), i: 0 });
        } else {
            Math.pow( c.magnitude , n )*cis( n*c.phase() );
        }
    }
    /**
     * squareRoot see pow
     */
    public static inline
    function squareRoot( c: Complex ): Complex{
        return pow( c, 0.5 );
    }
    /**
     * root2 see pow
     */
    public inline
    function root2(): Complex {
        return squareRoot( this );
    }
    /**
     * to Polar
     */
    @:to
    public inline
    function toPolar(): Polar {
       var polar: Polar = new Polar( phase, magnitude );
       return polar;
    }
    /**
     * from Polar
     */
    @:from
    public static inline
    function fromPolar( polar: Polar ) {
      return new Complex({ x: polar.magnitude * Math.cos( polar.phase ), y: polar.magnitude * Math.sin( polar.phase } );
    }
}
