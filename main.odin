package main

import "core:fmt"
import "vendor:raylib"
import "core:c"

main :: proc() {
    title : cstring = "Liam's Game"
    fmt.printf("\"%s\" is starting", title)

    actions : [512]Action
    currentAction : ^Action = nil

    screenWidth : c.int : 1280
    screenHeight : c.int : 1024

    actions[raylib.KeyboardKey.APOSTROPHE] = createAction("unimplemented")
    actions[raylib.KeyboardKey.COMMA] = createAction("unimplemented")
    actions[raylib.KeyboardKey.MINUS] = createAction("unimplemented")
    actions[raylib.KeyboardKey.PERIOD] = createAction("unimplemented")
    actions[raylib.KeyboardKey.SLASH] = createAction("unimplemented")
    actions[raylib.KeyboardKey.ZERO] = createAction("unimplemented")
    actions[raylib.KeyboardKey.ONE] = createAction("unimplemented")
    actions[raylib.KeyboardKey.TWO] = createAction("unimplemented")
    actions[raylib.KeyboardKey.THREE] = createAction("unimplemented")
    actions[raylib.KeyboardKey.FOUR] = createAction("unimplemented")
    actions[raylib.KeyboardKey.FIVE] = createAction("unimplemented")
    actions[raylib.KeyboardKey.SIX] = createAction("unimplemented")
    actions[raylib.KeyboardKey.SEVEN] = createAction("unimplemented")
    actions[raylib.KeyboardKey.EIGHT] = createAction("unimplemented")
    actions[raylib.KeyboardKey.NINE] = createAction("unimplemented")
    actions[raylib.KeyboardKey.SEMICOLON] = createAction("unimplemented")
    actions[raylib.KeyboardKey.EQUAL] = createAction("unimplemented")
    actions[raylib.KeyboardKey.A] = createAction("unimplemented")
    actions[raylib.KeyboardKey.B] = createAction("unimplemented")
    actions[raylib.KeyboardKey.C] = createAction("unimplemented")
    actions[raylib.KeyboardKey.D] = createAction("unimplemented")
    actions[raylib.KeyboardKey.E] = createAction("unimplemented")
    actions[raylib.KeyboardKey.F] = createAction("unimplemented")
    actions[raylib.KeyboardKey.G] = createAction("unimplemented")
    actions[raylib.KeyboardKey.H] = createAction("unimplemented")
    actions[raylib.KeyboardKey.I] = createAction("unimplemented")
    actions[raylib.KeyboardKey.J] = createAction("unimplemented")
    actions[raylib.KeyboardKey.K] = createAction("unimplemented")
    actions[raylib.KeyboardKey.L] = createAction("unimplemented")
    actions[raylib.KeyboardKey.M] = createAction("unimplemented")
    actions[raylib.KeyboardKey.N] = createAction("unimplemented")
    actions[raylib.KeyboardKey.O] = createAction("unimplemented")
    actions[raylib.KeyboardKey.P] = createAction("unimplemented")
    actions[raylib.KeyboardKey.Q] = createAction("unimplemented")
    actions[raylib.KeyboardKey.R] = createAction("unimplemented")
    actions[raylib.KeyboardKey.S] = createAction("unimplemented")
    actions[raylib.KeyboardKey.T] = createAction("unimplemented")
    actions[raylib.KeyboardKey.U] = createAction("unimplemented")
    actions[raylib.KeyboardKey.V] = createAction("unimplemented")
    actions[raylib.KeyboardKey.W] = createAction("unimplemented")
    actions[raylib.KeyboardKey.X] = createAction("unimplemented")
    actions[raylib.KeyboardKey.Y] = createAction("unimplemented")
    actions[raylib.KeyboardKey.Z] = createAction("unimplemented")
    actions[raylib.KeyboardKey.LEFT_BRACKET] = createAction("unimplemented")
    actions[raylib.KeyboardKey.BACKSLASH] = createAction("unimplemented")
    actions[raylib.KeyboardKey.RIGHT_BRACKET] = createAction("unimplemented")
    actions[raylib.KeyboardKey.GRAVE] = createAction("unimplemented")
    actions[raylib.KeyboardKey.SPACE] = createAction("unimplemented")
    actions[raylib.KeyboardKey.ESCAPE] = createAction("unimplemented")
    actions[raylib.KeyboardKey.ENTER] = createAction("unimplemented")
    actions[raylib.KeyboardKey.TAB] = createAction("unimplemented")
    actions[raylib.KeyboardKey.BACKSPACE] = createAction("unimplemented")
    actions[raylib.KeyboardKey.INSERT] = createAction("unimplemented")
    actions[raylib.KeyboardKey.DELETE] = createAction("unimplemented")
    actions[raylib.KeyboardKey.RIGHT] = createAction("unimplemented")
    actions[raylib.KeyboardKey.LEFT] = createAction("unimplemented")
    actions[raylib.KeyboardKey.DOWN] = createAction("unimplemented")
    actions[raylib.KeyboardKey.UP] = createAction("unimplemented")
    actions[raylib.KeyboardKey.PAGE_UP] = createAction("unimplemented")
    actions[raylib.KeyboardKey.PAGE_DOWN] = createAction("unimplemented")
    actions[raylib.KeyboardKey.HOME] = createAction("unimplemented")
    actions[raylib.KeyboardKey.END] = createAction("unimplemented")
    actions[raylib.KeyboardKey.CAPS_LOCK] = createAction("unimplemented")
    actions[raylib.KeyboardKey.SCROLL_LOCK] = createAction("unimplemented")
    actions[raylib.KeyboardKey.NUM_LOCK] = createAction("unimplemented")
    actions[raylib.KeyboardKey.PRINT_SCREEN] = createAction("unimplemented")
    actions[raylib.KeyboardKey.PAUSE] = createAction("unimplemented")
    actions[raylib.KeyboardKey.F1] = createAction("unimplemented")
    actions[raylib.KeyboardKey.F2] = createAction("unimplemented")
    actions[raylib.KeyboardKey.F3] = createAction("unimplemented")
    actions[raylib.KeyboardKey.F4] = createAction("unimplemented")
    actions[raylib.KeyboardKey.F5] = createAction("unimplemented")
    actions[raylib.KeyboardKey.F6] = createAction("unimplemented")
    actions[raylib.KeyboardKey.F7] = createAction("unimplemented")
    actions[raylib.KeyboardKey.F8] = createAction("unimplemented")
    actions[raylib.KeyboardKey.F9] = createAction("unimplemented")
    actions[raylib.KeyboardKey.F10] = createAction("unimplemented")
    actions[raylib.KeyboardKey.F11] = createAction("unimplemented")
    actions[raylib.KeyboardKey.F12] = createAction("unimplemented")
    actions[raylib.KeyboardKey.LEFT_SHIFT] = createAction("unimplemented")
    actions[raylib.KeyboardKey.LEFT_CONTROL] = createAction("unimplemented")
    actions[raylib.KeyboardKey.LEFT_ALT] = createAction("unimplemented")
    actions[raylib.KeyboardKey.LEFT_SUPER] = createAction("unimplemented")
    actions[raylib.KeyboardKey.RIGHT_SHIFT] = createAction("unimplemented")
    actions[raylib.KeyboardKey.RIGHT_CONTROL] = createAction("unimplemented")
    actions[raylib.KeyboardKey.RIGHT_ALT] = createAction("unimplemented")
    actions[raylib.KeyboardKey.RIGHT_SUPER] = createAction("unimplemented")
    actions[raylib.KeyboardKey.KB_MENU] = createAction("unimplemented")
    actions[raylib.KeyboardKey.KP_0] = createAction("unimplemented")
    actions[raylib.KeyboardKey.KP_1] = createAction("unimplemented")
    actions[raylib.KeyboardKey.KP_2] = createAction("unimplemented")
    actions[raylib.KeyboardKey.KP_3] = createAction("unimplemented")
    actions[raylib.KeyboardKey.KP_4] = createAction("unimplemented")
    actions[raylib.KeyboardKey.KP_5] = createAction("unimplemented")
    actions[raylib.KeyboardKey.KP_6] = createAction("unimplemented")
    actions[raylib.KeyboardKey.KP_7] = createAction("unimplemented")
    actions[raylib.KeyboardKey.KP_8] = createAction("unimplemented")
    actions[raylib.KeyboardKey.KP_9] = createAction("unimplemented")
    actions[raylib.KeyboardKey.KP_DECIMAL] = createAction("unimplemented")
    actions[raylib.KeyboardKey.KP_DIVIDE] = createAction("unimplemented")
    actions[raylib.KeyboardKey.KP_MULTIPLY] = createAction("unimplemented")
    actions[raylib.KeyboardKey.KP_SUBTRACT] = createAction("unimplemented")
    actions[raylib.KeyboardKey.KP_ADD] = createAction("unimplemented")
    actions[raylib.KeyboardKey.KP_ENTER] = createAction("unimplemented")
    actions[raylib.KeyboardKey.KP_EQUAL] = createAction("unimplemented")

    // Init
    {    
        raylib.InitWindow(screenWidth, screenHeight, title)
        raylib.SetTargetFPS(60)
        // raylib.ToggleFullscreen()
    }

    for ; !raylib.WindowShouldClose() ; {
        // Update
        {
            button := raylib.GetKeyPressed()

            if button == raylib.KeyboardKey.KEY_NULL {
                // currentAction = nil
            } else {
                currentAction = &actions[button]
            }

        }

        // Draw
        {
            raylib.BeginDrawing()
            {
                raylib.ClearBackground(raylib.RAYWHITE)

                if currentAction != nil {
                    raylib.DrawRectangle(
                        screenWidth / 2,
                        screenHeight / 2,
                        100, 100, raylib.RED
                    )
                }
            }
            raylib.EndDrawing()
        }
    }
}


createAction :: proc(name: string) -> Action {
    return Action{}
}

Action :: struct {
    image : raylib.Image,
    sound : raylib.Sound,
}

Vector2 :: struct {
    x : c.int,
    y : c.int,
}

