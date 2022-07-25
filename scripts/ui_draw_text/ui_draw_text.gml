/**
 * Draw text while avoiding alpha and blur issues
 * @param {Real}    x       The x coordinate of the drawn string.
 * @param {Real}    y 	    The y coordinate of the drawn string.
 * @param {String}  string  The string to draw.
 * @param {Real}    w       The maximum width in pixels of the string before a line break.
 * @param {Real}    sep     The distance in pixels between lines of text.
 */
function ui_draw_text(x, y, string, w = undefined, sep = -1) {
    // Save current blend mode for later reset
    var current_blend_mode = gpu_get_blendmode_ext_sepalpha();
    
    // Set blend mode to fix alpha issue when drawing font on a surface
    gpu_set_blendmode_ext_sepalpha(bm_src_alpha, bm_inv_src_alpha, bm_inv_dest_alpha, bm_one);
    
    // Draw the given text at the given coordinates, rounding them to avoid blur 
    // issues if the coordinates are not integers
    if (is_undefined(w)) {
        draw_text(floor(x), floor(y), string);
    } else {
        draw_text_ext(floor(x), floor(y), string, sep, w);
    }
    
    // Reset blend mode
	gpu_set_blendmode_ext_sepalpha(current_blend_mode);
}