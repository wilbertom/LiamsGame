package main

import (
	"fmt"
	"math/rand"
	"os"
	"path/filepath"
	"strconv"
	"strings"

	raylib "github.com/gen2brain/raylib-go/raylib"
)

func main() {
	title := "Liam's Game"

	fmt.Printf("Starting %s\n", title)

	actions := [512]Action{}
	var currentAction *Action = nil
	sounds := [25]raylib.Sound{}
	playChime := false
	currentChime := 0
	var margin int32 = 256

	fullscreen := false
	var screenWidth int32 = 0
	var screenHeight int32 = 0

	if fullscreen {
		// borderless windowed mode sets the correct width / height but there's
		// a split second where the window is the size the window is init with
		// setting to 0 also does the trick
		// getting these before InitWindow doesn't work on Linux
		screenWidth = int32(raylib.GetScreenWidth())
		screenHeight = int32(raylib.GetScreenHeight())
	} else {
		screenWidth = 1280
		screenHeight = 1024
	}

	// Init
	{
		raylib.InitWindow(screenWidth, screenHeight, title)

		{ // set these on linux, where they return 0 before InitWindow
			screenWidth = int32(raylib.GetScreenWidth())
			screenHeight = int32(raylib.GetScreenHeight())
		}

		raylib.SetTargetFPS(60)

		if fullscreen {
			raylib.ToggleBorderlessWindowed()
		}

		raylib.InitAudioDevice()
	}

	// Load
	{
		actions[raylib.KeyApostrophe] = createAction("ambulance")
		actions[raylib.KeyComma] = createAction("balloon")
		actions[raylib.KeyMinus] = createAction("banana")
		actions[raylib.KeyPeriod] = createAction("bear")
		actions[raylib.KeySlash] = createAction("book")
		actions[raylib.KeyZero] = createAction("brachiosaurus")
		actions[raylib.KeyOne] = createAction("bush")
		actions[raylib.KeyTwo] = createAction("cactus")
		actions[raylib.KeyThree] = createAction("calf")
		actions[raylib.KeyFour] = createAction("car")
		actions[raylib.KeyFive] = createAction("cat")
		actions[raylib.KeySix] = createAction("cheese")
		actions[raylib.KeySeven] = createAction("chicken")
		actions[raylib.KeyEight] = createAction("circle")
		actions[raylib.KeyNine] = createAction("cloud")
		actions[raylib.KeySemicolon] = createAction("convertible-car")
		actions[raylib.KeyEqual] = createAction("deer")
		actions[raylib.KeyA] = createAction("dog")
		actions[raylib.KeyB] = createAction("duck")
		actions[raylib.KeyC] = createAction("elephant")
		actions[raylib.KeyD] = createAction("firetruck")
		actions[raylib.KeyE] = createAction("flower")
		actions[raylib.KeyF] = createAction("fox")
		actions[raylib.KeyG] = createAction("giraffe")
		actions[raylib.KeyH] = createAction("goat")
		actions[raylib.KeyI] = createAction("griffin")
		actions[raylib.KeyJ] = createAction("hedgehog")
		actions[raylib.KeyK] = createAction("hexagon")
		actions[raylib.KeyL] = createAction("horse")
		actions[raylib.KeyM] = createAction("kite")
		actions[raylib.KeyN] = createAction("koala")
		actions[raylib.KeyO] = createAction("leaf")
		actions[raylib.KeyP] = createAction("lion")
		actions[raylib.KeyQ] = createAction("mermaid")
		actions[raylib.KeyR] = createAction("milk-carton")
		actions[raylib.KeyS] = createAction("monkey")
		actions[raylib.KeyT] = createAction("orange")
		actions[raylib.KeyU] = createAction("owl")
		actions[raylib.KeyV] = createAction("panda")
		actions[raylib.KeyW] = createAction("penguin")
		actions[raylib.KeyX] = createAction("phoenix")
		actions[raylib.KeyY] = createAction("pig")
		actions[raylib.KeyZ] = createAction("pumpkin")
		actions[raylib.KeyLeftBracket] = createAction("rabbit")
		actions[raylib.KeyBackSlash] = createAction("raccoon")
		actions[raylib.KeyRightBracket] = createAction("rectangle")
		actions[raylib.KeyGrave] = createAction("squirrel")
		actions[raylib.KeySpace] = createAction("star")
		actions[raylib.KeyEscape] = createAction("strawberry")
		actions[raylib.KeyEnter] = createAction("submarine")
		actions[raylib.KeyTab] = createAction("sunflower")
		actions[raylib.KeyBackspace] = createAction("unimplemented")
		actions[raylib.KeyInsert] = createAction("tiger")
		actions[raylib.KeyDelete] = createAction("tomato")
		actions[raylib.KeyRight] = createAction("tractor")
		actions[raylib.KeyLeft] = createAction("train")
		actions[raylib.KeyDown] = createAction("triangle")
		actions[raylib.KeyUp] = createAction("triceratops")
		actions[raylib.KeyPageUp] = createAction("troll")
		actions[raylib.KeyPageDown] = createAction("yeti")
		actions[raylib.KeyHome] = createAction("unimplemented")
		actions[raylib.KeyEnd] = createAction("unimplemented")
		actions[raylib.KeyCapsLock] = createAction("unimplemented")
		actions[raylib.KeyScrollLock] = createAction("unimplemented")
		actions[raylib.KeyNumLock] = createAction("unimplemented")
		actions[raylib.KeyPrintScreen] = createAction("unimplemented")
		actions[raylib.KeyPause] = createAction("unimplemented")
		actions[raylib.KeyF1] = createAction("unimplemented")
		actions[raylib.KeyF2] = createAction("unimplemented")
		actions[raylib.KeyF3] = createAction("unimplemented")
		actions[raylib.KeyF4] = createAction("unimplemented")
		actions[raylib.KeyF5] = createAction("unimplemented")
		actions[raylib.KeyF6] = createAction("unimplemented")
		actions[raylib.KeyF7] = createAction("unimplemented")
		actions[raylib.KeyF8] = createAction("unimplemented")
		actions[raylib.KeyF9] = createAction("unimplemented")
		actions[raylib.KeyF10] = createAction("unimplemented")
		actions[raylib.KeyF11] = createAction("unimplemented")
		actions[raylib.KeyF12] = createAction("unimplemented")
		actions[raylib.KeyLeftShift] = createAction("unimplemented")
		actions[raylib.KeyLeftControl] = createAction("unimplemented")
		actions[raylib.KeyLeftAlt] = createAction("unimplemented")
		actions[raylib.KeyLeftSuper] = createAction("unimplemented")
		actions[raylib.KeyRightShift] = createAction("unimplemented")
		actions[raylib.KeyRightControl] = createAction("unimplemented")
		actions[raylib.KeyRightAlt] = createAction("unimplemented")
		actions[raylib.KeyRightSuper] = createAction("unimplemented")
		actions[raylib.KeyKbMenu] = createAction("unimplemented")
		actions[raylib.KeyKp0] = createAction("unimplemented")
		actions[raylib.KeyKp1] = createAction("unimplemented")
		actions[raylib.KeyKp2] = createAction("unimplemented")
		actions[raylib.KeyKp3] = createAction("unimplemented")
		actions[raylib.KeyKp4] = createAction("unimplemented")
		actions[raylib.KeyKp5] = createAction("unimplemented")
		actions[raylib.KeyKp6] = createAction("unimplemented")
		actions[raylib.KeyKp7] = createAction("unimplemented")
		actions[raylib.KeyKp8] = createAction("unimplemented")
		actions[raylib.KeyKp9] = createAction("unimplemented")
		actions[raylib.KeyKpDecimal] = createAction("unimplemented")
		actions[raylib.KeyKpDivide] = createAction("unimplemented")
		actions[raylib.KeyKpMultiply] = createAction("unimplemented")
		actions[raylib.KeyKpSubtract] = createAction("unimplemented")
		actions[raylib.KeyKpAdd] = createAction("unimplemented")
		actions[raylib.KeyKpEnter] = createAction("unimplemented")
		actions[raylib.KeyKpEqual] = createAction("unimplemented")

		for i := range sounds {
			si := strconv.Itoa(i)
			sounds[i] = raylib.LoadSound(
				pathWithExtension("wav", "assets/sounds", "Wind Chimes "+si),
			)
		}
	}

	for !raylib.WindowShouldClose() {

		{ // Update
			button := raylib.GetKeyPressed()

			if button == raylib.KeyNull {
				playChime = false
			} else {
				currentAction = &actions[button]
				currentAction.position.x = rand.Int31n(screenWidth - margin)
				currentAction.position.y = rand.Int31n(screenHeight - margin)

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
				raylib.ClearBackground(raylib.RayWhite)

				if currentAction != nil && currentAction.implemented {
					raylib.DrawTexture(
						currentAction.texture,
						currentAction.position.x,
						currentAction.position.y,
						raylib.White,
					)
				}
			}
			raylib.EndDrawing()
		}
	}
}

func createAction(name string) Action {
	var fp string

	if name != "unimplemented" {
		fp = pathWithExtension("png", "assets/images/", name)
	} else {
		fps, err := os.ReadDir("assets/images/")
		if err != nil {
			panic("Failed to list images")
		}
		fps = Filter(func(path os.DirEntry) bool {
			return strings.HasSuffix(path.Name(), ".png")
		}, fps)
		fp = "assets/images/" + Choice(fps).Name()
	}

	fmt.Printf("Loading %s\n", fp)
	image := raylib.LoadImage(fp)
	raylib.ImageResize(image, 256, 256)
	texture := raylib.LoadTextureFromImage(image)

	return Action{implemented: true, texture: texture}
}

func pathWithExtension(extension string, paths ...string) string {
	return filepath.Join(paths...) + "." + extension
}

type Action struct {
	implemented bool
	texture     raylib.Texture2D
	position    Vector2
}

type Vector2 struct {
	x int32
	y int32
}

func Choice[T any](arr []T) T {
	return arr[rand.Intn(len(arr))]
}

func Filter[T any](f func(e T) bool, arr []T) []T {
	var arr2 []T

	for _, e := range arr {
		if f(e) {
			arr2 = append(arr2, e)
		}
	}

	return arr2
}
