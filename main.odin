package main

import "core:fmt"
import "vendor:raylib"
import "core:c"
import "core:strings"
import "core:path/filepath"

main :: proc() {
    title : cstring = "Liam's Game"
    fmt.printf("\"%s\" is starting", title)

    actions : [512]Action
    currentAction : ^Action = nil

    screenWidth : c.int : 1280
    screenHeight : c.int : 1024

    // Init
    {    
        raylib.InitWindow(screenWidth, screenHeight, title)
        raylib.SetTargetFPS(60)
        // raylib.ToggleFullscreen()
    }

    // Load
    {
        actions[raylib.KeyboardKey.APOSTROPHE] = createAction("banana")
        actions[raylib.KeyboardKey.COMMA] = createAction("bear")
        actions[raylib.KeyboardKey.MINUS] = createAction("brachiosaurus")
        actions[raylib.KeyboardKey.PERIOD] = createAction("bush")
        actions[raylib.KeyboardKey.SLASH] = createAction("convertible-cactus")
        actions[raylib.KeyboardKey.ZERO] = createAction("calf")
        actions[raylib.KeyboardKey.ONE] = createAction("car")
        actions[raylib.KeyboardKey.TWO] = createAction("cat")
        actions[raylib.KeyboardKey.THREE] = createAction("t-cheese")
        actions[raylib.KeyboardKey.FOUR] = createAction("chicken")
        actions[raylib.KeyboardKey.FIVE] = createAction("circle")
        actions[raylib.KeyboardKey.SIX] = createAction("convertible-car")
        actions[raylib.KeyboardKey.SEVEN] = createAction("deer")
        actions[raylib.KeyboardKey.EIGHT] = createAction("dog")
        actions[raylib.KeyboardKey.NINE] = createAction("duck")
        actions[raylib.KeyboardKey.SEMICOLON] = createAction("elephant")
        actions[raylib.KeyboardKey.EQUAL] = createAction("firetruck")
        actions[raylib.KeyboardKey.A] = createAction("flower")
        actions[raylib.KeyboardKey.B] = createAction("giraffe")
        actions[raylib.KeyboardKey.C] = createAction("goat")
        actions[raylib.KeyboardKey.D] = createAction("hedgehog")
        actions[raylib.KeyboardKey.E] = createAction("horse")
        actions[raylib.KeyboardKey.F] = createAction("koala")
        actions[raylib.KeyboardKey.G] = createAction("lion")
        actions[raylib.KeyboardKey.H] = createAction("milk-carton")
        actions[raylib.KeyboardKey.I] = createAction("monkey")
        actions[raylib.KeyboardKey.J] = createAction("orange")
        actions[raylib.KeyboardKey.K] = createAction("owl")
        actions[raylib.KeyboardKey.L] = createAction("panda")
        actions[raylib.KeyboardKey.M] = createAction("penguin")
        actions[raylib.KeyboardKey.N] = createAction("pig")
        actions[raylib.KeyboardKey.O] = createAction("rabbit")
        actions[raylib.KeyboardKey.P] = createAction("raccoon")
        actions[raylib.KeyboardKey.Q] = createAction("rectangle")
        actions[raylib.KeyboardKey.R] = createAction("squirrel")
        actions[raylib.KeyboardKey.S] = createAction("star")
        actions[raylib.KeyboardKey.T] = createAction("strawberry")
        actions[raylib.KeyboardKey.U] = createAction("sunflower")
        actions[raylib.KeyboardKey.V] = createAction("t-rex")
        actions[raylib.KeyboardKey.W] = createAction("tiger")
        actions[raylib.KeyboardKey.X] = createAction("triangle")
        actions[raylib.KeyboardKey.Y] = createAction("triceratops")
        actions[raylib.KeyboardKey.Z] = createAction("zebra")
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

                    if currentAction.implemented {
                        raylib.DrawTexture(
                            currentAction.texture,
                            0,
                            0,
                            raylib.WHITE,
                        )
                    } else {
                        raylib.DrawRectangle(
                            screenWidth / 2,
                            screenHeight / 2,
                            100, 100, raylib.RED
                        )
                    }
                }
            }
            raylib.EndDrawing()
        }
    }
}


createAction :: proc(name: string) -> Action {
    texture : raylib.Texture2D

    if name != "unimplemented" {
        fp := strings.join({filepath.join({"assets/images/", name}), "png"}, ".")
        fpcstring := strings.clone_to_cstring(fp)
        texture := raylib.LoadTexture(fpcstring)

        return Action{implemented = true, texture = texture}
    }

    return Action{}
}

Action :: struct {
    implemented: bool,
    texture : raylib.Texture2D,
    sound : raylib.Sound,
}

Vector2 :: struct {
    x : c.int,
    y : c.int,
}

