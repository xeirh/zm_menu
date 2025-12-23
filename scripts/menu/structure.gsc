// https://github.com/xeirh

#include scripts\menu\structure_resources;
#include scripts\menu\utilities;

//
display_title()
{
    if( !isdefined( self.title ) )
        self.title = self create_text( self get_title(), self.font, self.font_scale, "TOP_LEFT", "TOPCENTER", ( self.x_offset + 4 ), ( self.y_offset + 2 ), ( 0.22, 0.25, 0.28 ), 1 );
    else
        self.title set_text( self get_title() );
}

//
display_description()
{
    if( isdefined( self.description ) && !self.description_enabled || isdefined( self.description ) && !isdefined( self.structure[ self get_cursor() ].description ) )
        self.description destroy_element();

    if( isdefined( self.structure[ self get_cursor() ].description ) && self.description_enabled )
    {
        if( !isdefined( self.description ) )
            self.description = self create_text( self.structure[ self get_cursor() ].description, self.font, self.font_scale, "TOP_LEFT", "TOPCENTER", ( self.x_offset + 4 ), ( self.y_offset + 34 ), ( 0.22, 0.25, 0.28 ), 1 );
        else
            self.description set_text( self.structure[ self get_cursor() ].description );
    }
}