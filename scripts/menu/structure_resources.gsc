// https://github.com/xeirh

#include scripts\menu\structure;
#include scripts\menu\utilities;

//
set_menu( menu )
{
    self.menu = menu;
}

//
get_menu()
{
    return self.menu;
}

//
set_title( title )
{
    self.menu_title = title;
}

//
get_title()
{
    return self.menu_title;
}

//
set_cursor( index )
{
    self.cursor[ self get_menu() ] = index;
}

//
get_cursor()
{
    return self.cursor[ self get_menu() ];
}

//
is_opened()
{
    if( !isdefined( self.menu_opened ) )
        self.menu_opened = false;

    return self.menu_opened;
}

//
is_locked()
{
    if( !isdefined( self.menu_locked ) )
        self.menu_locked = false;

    return self.menu_locked;
}

//
add_menu( title )
{
    self.structure = [];

    if( !isdefined( self get_cursor() ) )
        self set_cursor( 0 );

    self set_title( title );
}

//
add_option( title, description, operation, parameters )
{
    structure = spawnstruct();
    structure.title = title;
    structure.description = description;
    structure.operation = ternary_compare( isdefined( operation ), operation, common_scripts\utility::empty );
    structure.parameters = parameters;

    self.structure[ self.structure.size ] = structure;
}

//
execute_operation( operation, parameters )
{
    if( !isdefined( operation ) )
        return;

    if( !isdefined( parameters ) || !isdefined( parameters.size ) || !parameters.size )
        return self [[ operation ]]();

    switch( parameters.size )
    {
        case 1:
            return self [[ operation ]]( parameters[ 0 ] );

        case 2:
            return self [[ operation ]]( parameters[ 0 ], parameters[ 1 ] );

        case 3:
            return self [[ operation ]]( parameters[ 0 ], parameters[ 1 ], parameters[ 2 ] );

        default:
            return self [[ operation ]]( parameters[ 0 ], parameters[ 1 ], parameters[ 2 ], parameters[ 3 ] );
    }
}