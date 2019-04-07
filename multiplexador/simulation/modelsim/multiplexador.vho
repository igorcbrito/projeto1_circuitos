-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.0 Build 156 04/24/2013 SJ Web Edition"

-- DATE "03/29/2019 15:38:31"

-- 
-- Device: Altera EP2C35F672C6 Package FBGA672
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	multiplexador IS
    PORT (
	x0 : IN std_logic;
	x1 : IN std_logic;
	x2 : IN std_logic;
	x3 : IN std_logic;
	s1 : IN std_logic;
	s0 : IN std_logic;
	y : OUT std_logic
	);
END multiplexador;

-- Design Ports Information
-- y	=>  Location: PIN_AD21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x1	=>  Location: PIN_V1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- x0	=>  Location: PIN_V2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- s1	=>  Location: PIN_N26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- s0	=>  Location: PIN_N25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- x3	=>  Location: PIN_U3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- x2	=>  Location: PIN_U4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF multiplexador IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_x0 : std_logic;
SIGNAL ww_x1 : std_logic;
SIGNAL ww_x2 : std_logic;
SIGNAL ww_x3 : std_logic;
SIGNAL ww_s1 : std_logic;
SIGNAL ww_s0 : std_logic;
SIGNAL ww_y : std_logic;
SIGNAL \x3~combout\ : std_logic;
SIGNAL \s1~combout\ : std_logic;
SIGNAL \x1~combout\ : std_logic;
SIGNAL \x0~combout\ : std_logic;
SIGNAL \s0~combout\ : std_logic;
SIGNAL \x2~combout\ : std_logic;
SIGNAL \y~0_combout\ : std_logic;
SIGNAL \y~1_combout\ : std_logic;

BEGIN

ww_x0 <= x0;
ww_x1 <= x1;
ww_x2 <= x2;
ww_x3 <= x3;
ww_s1 <= s1;
ww_s0 <= s0;
y <= ww_y;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: PIN_U3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\x3~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_x3,
	combout => \x3~combout\);

-- Location: PIN_N26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\s1~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_s1,
	combout => \s1~combout\);

-- Location: PIN_V1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\x1~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_x1,
	combout => \x1~combout\);

-- Location: PIN_V2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\x0~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_x0,
	combout => \x0~combout\);

-- Location: PIN_N25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\s0~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_s0,
	combout => \s0~combout\);

-- Location: PIN_U4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\x2~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_x2,
	combout => \x2~combout\);

-- Location: LCCOMB_X1_Y12_N0
\y~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \y~0_combout\ = (\s0~combout\ & ((\x3~combout\) # ((!\s1~combout\)))) # (!\s0~combout\ & (((\s1~combout\ & \x2~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x3~combout\,
	datab => \s0~combout\,
	datac => \s1~combout\,
	datad => \x2~combout\,
	combout => \y~0_combout\);

-- Location: LCCOMB_X1_Y12_N18
\y~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \y~1_combout\ = (\s1~combout\ & (((\y~0_combout\)))) # (!\s1~combout\ & ((\y~0_combout\ & (\x1~combout\)) # (!\y~0_combout\ & ((\x0~combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s1~combout\,
	datab => \x1~combout\,
	datac => \x0~combout\,
	datad => \y~0_combout\,
	combout => \y~1_combout\);

-- Location: PIN_AD21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\y~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \y~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_y);
END structure;


