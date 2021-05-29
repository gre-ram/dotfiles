#include QMK_KEYBOARD_H

// Configure the global tapping term (default: 200ms)
#define TAPPING_TERM 200

// Prevent normal rollover on alphas from accidentally triggering mods.
#define IGNORE_MOD_TAP_INTERRUPT

// Enable rapid switch from tap to hold, disables double tap hold auto-repeat.
#define TAPPING_FORCE_HOLD

// Apply the modifier on keys that are tapped during a short hold of a modtap
#define PERMISSIVE_HOLD





const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
	[0] = LAYOUT_split_3x6_3(KC_TAB, KC_Q, KC_W, KC_E, KC_R, KC_T, DE_Z, KC_U, KC_I, KC_O, KC_P, DE_UDIA, LT(3,KC_ESC), KC_A, MT(MOD_LALT, KC_S), MT(MOD_LCTL, KC_D), MT(MOD_LGUI, KC_F), KC_G, KC_H, MT(MOD_RGUI, KC_J), MT(MOD_RCTL, KC_K), MT(MOD_RALT, KC_L), DE_ODIA , DE_ADIA, KC_LSFT, DE_Y, KC_X, KC_C, KC_V, KC_B, KC_N, KC_M, DE_COMM, DE_DOT, DE_SS , KC_RSFT, TT(1), KC_HYPR, KC_SPC, KC_BSPC, KC_ENT, TT(1)),
	[1] = LAYOUT_split_3x6_3(DE_DQUO, DE_CIRC, DE_DLR , DE_PIPE, DE_LBRC, DE_RBRC, KC_P7, KC_P8, KC_P9, DE_PERC, DE_SLSH , DE_EXLM, DE_QUOT, DE_AT, MT(MOD_LALT, DE_HASH), MT(MOD_LCTL, DE_STIL), MT(MOD_LGUI, DE_LPRN), DE_RPRN, KC_P4, MT(MOD_RGUI, KC_P5), MT(MOD_RCTL, KC_P6), MT(MOD_RALT, DE_PLUS), DE_MINS, DE_EQL, TG(2), DE_UNDS, DE_AMPR , DE_BSLS , DE_LCBR, DE_RCBR, KC_P1, KC_P2, KC_P3, KC_P0, DE_ASTR, TG(2), KC_TRNS, KC_HYPR, KC_SPC, KC_BSPC, KC_ENT, KC_TRNS),
	[2] = LAYOUT_split_3x6_3(KC_NO, DE_DEG, DE_EURO , KC_NO, KC_NO, KC_NO, KC_F7, KC_F8, KC_F9, KC_F10, KC_F11, KC_F12, KC_NO, KC_NO, KC_NO, KC_NO, DE_LABK, DE_RABK, KC_F4, KC_F5, KC_F6, KC_BRIU, KC_VOLU, KC_MUTE, KC_TRNS, KC_NO, KC_NO, KC_NO, DE_GRV, DE_ACUT, KC_F1, KC_F2, KC_F3, KC_BRID, KC_VOLD, KC_TRNS, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO),
	[3] = LAYOUT_split_3x6_3(KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_LEFT, KC_DOWN, KC_UP, KC_RGHT, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO)
};

