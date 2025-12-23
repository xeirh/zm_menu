// https://github.com/xeirh

ternary_compare( condition, result_1, result_2 )
{
    if( condition )
        return result_1;

    return result_2;
}

auto_archive()
{
    if( !isdefined( self.element_result ) )
        self.element_result = 0;

    return self.element_result > 19;
}

create_text( text, font, font_scale, point, relative_point, x_offset, y_offset, color, alpha )
{
    element = self maps\mp\gametypes_zm\_hud_util::createfontstring( font, font_scale );
    element maps\mp\gametypes_zm\_hud_util::setpoint( point, relative_point, x_offset, y_offset );

    element.alpha = alpha;
    element.anchor = self;
    element.archived = self auto_archive();
    element.color = color;
    element.hidewheninmenu = true;
    element.sort = self.element_result;

    element set_text( text );

    self.element_result++;
    return element;
}

create_shader( shader, point, relative_point, x_offset, y_offset, width, height, color, alpha )
{
    element = self maps\mp\gametypes_zm\_hud_util::createicon( shader, width, height );
    element maps\mp\gametypes_zm\_hud_util::setpoint( point, relative_point, x_offset, y_offset );

    element.alpha = alpha;
    element.anchor = self;
    element.archived = self auto_archive();
    element.color = color;
    element.hidewheninmenu = true;
    element.sort = self.element_result;

    element set_shader( shader, width, height );

    self.element_result++;
    return element;
}

set_text( text )
{
    if( isint( text ) || isfloat( text ) )
    {
        self setvalue( text );
        return;
    }

    self settext( text );
}

set_shader( shader, width, height )
{
    if( !isdefined( shader ) || !isdefined( width ) || !isdefined( height ) )
        return;

    self.shader = shader;
    self.width = width;
    self.height = height;

    self setshader( shader, width, height );
}

x_offset( x_offset, time )
{
    if( !isdefined( time ) )
        time = 0;

    if( time > 0 )
        self moveovertime( time );

    self.x = x_offset;

    if( time > 0 )
        wait time;
}

y_offset( y_offset, time )
{
    if( !isdefined( time ) )
        time = 0;

    if( time > 0 )
        self moveovertime( time );

    self.y = y_offset;

    if( time > 0 )
        wait time;
}

destroy_element()
{
    if( isdefined( self.anchor ) )
        self.anchor.element_result--;

    self maps\mp\gametypes_zm\_hud_util::destroyelem();
}

get_players()
{
    return level.players;
}

get_zombies( species )
{
    if( !isdefined( species ) )
        species = "all";

    return getaispeciesarray( level.zombie_team, species );
}

precision( value, decimal_places )
{
    factor = pow( 10, decimal_places );
    return ( int( ( float( value ) * factor ) ) / factor );
}

calculate_distance( start_point, end_point )
{
    return ( distance( start_point, end_point ) * 0.0254 );
}