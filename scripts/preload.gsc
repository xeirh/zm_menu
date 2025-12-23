// https://github.com/xeirh

#include scripts\menu\structure_resources;
#include scripts\menu\structure;
#include scripts\menu\utilities;

//
main()
{}

//
init()
{
    level.unique_string = [];
    level.private_match = !level.rankedmatch;

    level initial_callback();
    level initial_precache();
}

//
initial_callback()
{
    maps\mp\zombies\_zm_utility::onplayerconnect_callback();
    maps\mp\zombies\_zm_utility::onplayerdisconnect_callback();
}

//
initial_precache()
{}

//
initial_variable()
{
    self.cursor = [];
    self.previous = [];

    self.font = "default";
    self.font_scale = 1;
    self.option_limit = 11;
    self.option_spacing = 16;
    self.x_offset = -400;
    self.y_offset = 80;
    self.width = 0;
    self.scrolling_buffer = 0.08;

    self.gestures_enabled = true;
    self.description_enabled = true;

    option = array( ( 0.63, 0.18, 0.98 ), ( 0.97, 0.20, 0.20 ) );
    choice = common_scripts\utility::random( option );

    self.color_theme = choice;

    self set_menu( "Main Menu" );
    self set_title( self get_menu() );
}

//
initial_observer()
{
    self endon( "disconnect" );

    while( !self is_locked() )
    {
        if( !self is_opened() )
        {
            if( self actionslotonebuttonpressed() )
            {
                if( self.gestures_enabled )
                    self playsoundtoplayer( "", self );

                while( self actionslotonebuttonpressed() )
                    wait 0.18;
            }
        }
        else
        {
            cursor = self get_cursor();

            if( self actionslottwobuttonpressed() )
            {
                if( self.gestures_enabled )
                    self playsoundtoplayer( ternary_compare( isdefined( self.previous[ ( self.previous.size - 1 ) ] ), "", "" ), self );

                while( self actionslottwobuttonpressed() )
                    wait 0.18;
            }
        }

        wait 0.05;
    }
}