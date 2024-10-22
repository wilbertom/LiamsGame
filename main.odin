package main

import "core:fmt"
import "vendor:raylib"
import "core:c"
import "core:strings"
import "core:path/filepath"
import "core:strconv"


main :: proc() {
    title : cstring = "Liam's Game"
    fmt.printf("\"%s\" is starting", title)

    actions : [512]Action
    currentAction : ^Action = nil
    sounds : [25]raylib.Sound
    playChime : bool
    currentChime : int

    fullscreen : bool = true
    screenWidth : c.int
    screenHeight : c.int

    if fullscreen {
        // borderless windowed mode sets the correct width / height but there's
        // a split second where the window is the size the window is init with
        // setting to 0 also does the trick
        screenWidth = raylib.GetScreenWidth()
        screenHeight = raylib.GetScreenHeight()
    } else {
        screenWidth = 1280
        screenHeight = 1024
    }


    // Init
    {
        raylib.InitWindow(screenWidth, screenHeight, title)
        raylib.SetTargetFPS(60)

        if fullscreen {
            raylib.ToggleBorderlessWindowed()
        }

        raylib.InitAudioDevice()
    }

    // Load
    {
        actions[raylib.KeyboardKey.APOSTROPHE] = createAction("ambulance")
        actions[raylib.KeyboardKey.COMMA] = createAction("balloon")
        actions[raylib.KeyboardKey.MINUS] = createAction("banana")
        actions[raylib.KeyboardKey.PERIOD] = createAction("bear")
        actions[raylib.KeyboardKey.SLASH] = createAction("book")
        actions[raylib.KeyboardKey.ZERO] = createAction("brachiosaurus")
        actions[raylib.KeyboardKey.ONE] = createAction("bush")
        actions[raylib.KeyboardKey.TWO] = createAction("cactus")
        actions[raylib.KeyboardKey.THREE] = createAction("calf")
        actions[raylib.KeyboardKey.FOUR] = createAction("car")
        actions[raylib.KeyboardKey.FIVE] = createAction("cat")
        actions[raylib.KeyboardKey.SIX] = createAction("cheese")
        actions[raylib.KeyboardKey.SEVEN] = createAction("chicken")
        actions[raylib.KeyboardKey.EIGHT] = createAction("circle")
        actions[raylib.KeyboardKey.NINE] = createAction("cloud")
        actions[raylib.KeyboardKey.SEMICOLON] = createAction("convertible-car")
        actions[raylib.KeyboardKey.EQUAL] = createAction("deer")
        actions[raylib.KeyboardKey.A] = createAction("dog")
        actions[raylib.KeyboardKey.B] = createAction("duck")
        actions[raylib.KeyboardKey.C] = createAction("elephant")
        actions[raylib.KeyboardKey.D] = createAction("firetruck")
        actions[raylib.KeyboardKey.E] = createAction("flower")
        actions[raylib.KeyboardKey.F] = createAction("fox")
        actions[raylib.KeyboardKey.G] = createAction("giraffe")
        actions[raylib.KeyboardKey.H] = createAction("goat")
        actions[raylib.KeyboardKey.I] = createAction("griffin")
        actions[raylib.KeyboardKey.J] = createAction("hedgehog")
        actions[raylib.KeyboardKey.K] = createAction("hexagon")
        actions[raylib.KeyboardKey.L] = createAction("horse")
        actions[raylib.KeyboardKey.M] = createAction("kite")
        actions[raylib.KeyboardKey.N] = createAction("koala")
        actions[raylib.KeyboardKey.O] = createAction("leaf")
        actions[raylib.KeyboardKey.P] = createAction("lion")
        actions[raylib.KeyboardKey.Q] = createAction("mermaid")
        actions[raylib.KeyboardKey.R] = createAction("milk-carton")
        actions[raylib.KeyboardKey.S] = createAction("monkey")
        actions[raylib.KeyboardKey.T] = createAction("orange")
        actions[raylib.KeyboardKey.U] = createAction("owl")
        actions[raylib.KeyboardKey.V] = createAction("panda")
        actions[raylib.KeyboardKey.W] = createAction("penguin")
        actions[raylib.KeyboardKey.X] = createAction("phoenix")
        actions[raylib.KeyboardKey.Y] = createAction("pig")
        actions[raylib.KeyboardKey.Z] = createAction("pumpkin")
        actions[raylib.KeyboardKey.LEFT_BRACKET] = createAction("rabbit")
        actions[raylib.KeyboardKey.BACKSLASH] = createAction("raccoon")
        actions[raylib.KeyboardKey.RIGHT_BRACKET] = createAction("rectangle")
        actions[raylib.KeyboardKey.GRAVE] = createAction("squirrel")
        actions[raylib.KeyboardKey.SPACE] = createAction("star")
        actions[raylib.KeyboardKey.ESCAPE] = createAction("strawberry")
        actions[raylib.KeyboardKey.ENTER] = createAction("submarine")
        actions[raylib.KeyboardKey.TAB] = createAction("sunflower")
        actions[raylib.KeyboardKey.BACKSPACE] = createAction("unimplemented")
        actions[raylib.KeyboardKey.INSERT] = createAction("tiger")
        actions[raylib.KeyboardKey.DELETE] = createAction("tomato")
        actions[raylib.KeyboardKey.RIGHT] = createAction("tractor")
        actions[raylib.KeyboardKey.LEFT] = createAction("train")
        actions[raylib.KeyboardKey.DOWN] = createAction("triangle")
        actions[raylib.KeyboardKey.UP] = createAction("triceratops")
        actions[raylib.KeyboardKey.PAGE_UP] = createAction("troll")
        actions[raylib.KeyboardKey.PAGE_DOWN] = createAction("yeti")
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

        for i in 0..=(len(sounds) - 1) {
            sibuf : [4]byte
            si := strconv.itoa(sibuf[:], i)
            sounds[i] = raylib.LoadSound(
                strings.clone_to_cstring(
                    pathWithExtension({"assets/sounds", strings.join({"Wind Chimes ", si}, "")}, "wav")
                )
            )

        }
    }

    for ; !raylib.WindowShouldClose() ; {
        // Update
        {
            button := raylib.GetKeyPressed()

            fmt.println("%d pressed", button)

            if button == raylib.KeyboardKey.KEY_NULL {
                playChime = false
            } else {
                currentAction = &actions[button]

                playChime = true
                currentChime += 1
                if currentChime > (len(sounds) - 1) {
                    currentChime = 0
                }
            }

        }

        { // Sounds
            if playChime {
                raylib.PlaySound(sounds[currentChime])
            }
        }

        { // Draw
            raylib.BeginDrawing()
            {
                raylib.ClearBackground(raylib.RAYWHITE)

                if currentAction != nil && currentAction.implemented {
                    raylib.DrawTexture(
                        currentAction.texture,
                        0,
                        0,
                        raylib.WHITE,
                    )
                }
            }
            raylib.EndDrawing()
        }
    }
}


createAction :: proc(name: string) -> Action {
    texture : raylib.Texture2D

    if name != "unimplemented" {
        { // Load texture
            fp := pathWithExtension({"assets/images/", name}, "png")
            fpcstring := strings.clone_to_cstring(fp)
            image := raylib.LoadImage(fpcstring)
            raylib.ImageResize(&image, 512, 512)
            texture = raylib.LoadTextureFromImage(image)
        }

        return Action{implemented = true, texture = texture}
    }

    return Action{}
}

pathWithExtension :: proc(paths: []string, extension: string) -> string {
    return strings.join({filepath.join(paths), extension}, ".")
}

Action :: struct {
    implemented: bool,
    texture : raylib.Texture2D,
}

Vector2 :: struct {
    x : c.int,
    y : c.int,
}

