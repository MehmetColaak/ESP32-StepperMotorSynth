{
	"boxes" : [ 		{
			"box" : 			{
				"maxclass" : "message",
				"text" : "55 0",
				"patching_rect" : [ 1084.0, 126.0, 50.0, 22.0 ],
				"numoutlets" : 1,
				"outlettype" : [ "" ],
				"id" : "obj-6",
				"numinlets" : 2
			}

		}
, 		{
			"box" : 			{
				"maxclass" : "message",
				"text" : "55 0",
				"patching_rect" : [ 914.0, 126.0, 50.0, 22.0 ],
				"numoutlets" : 1,
				"outlettype" : [ "" ],
				"id" : "obj-7",
				"numinlets" : 2
			}

		}
, 		{
			"box" : 			{
				"maxclass" : "message",
				"text" : "55 0",
				"patching_rect" : [ 735.0, 126.0, 50.0, 22.0 ],
				"numoutlets" : 1,
				"outlettype" : [ "" ],
				"id" : "obj-8",
				"numinlets" : 2
			}

		}
, 		{
			"box" : 			{
				"maxclass" : "newobj",
				"text" : "loadmess 7",
				"patching_rect" : [ 1142.0, 126.0, 70.0, 22.0 ],
				"numoutlets" : 1,
				"outlettype" : [ "" ],
				"id" : "obj-9",
				"numinlets" : 1
			}

		}
, 		{
			"box" : 			{
				"maxclass" : "newobj",
				"text" : "loadmess 6",
				"patching_rect" : [ 975.0, 126.0, 70.0, 22.0 ],
				"numoutlets" : 1,
				"outlettype" : [ "" ],
				"id" : "obj-10",
				"numinlets" : 1
			}

		}
, 		{
			"box" : 			{
				"maxclass" : "newobj",
				"text" : "loadmess 5",
				"patching_rect" : [ 801.0, 126.0, 70.0, 22.0 ],
				"numoutlets" : 1,
				"outlettype" : [ "" ],
				"id" : "obj-15",
				"numinlets" : 1
			}

		}
, 		{
			"box" : 			{
				"maxclass" : "newobj",
				"text" : "midiselect @note all @ch 7",
				"patching_rect" : [ 1057.0, 90.0, 154.0, 22.0 ],
				"numoutlets" : 8,
				"outlettype" : [ "", "", "", "int", "int", "", "int", "int" ],
				"id" : "obj-16",
				"numinlets" : 1
			}

		}
, 		{
			"box" : 			{
				"maxclass" : "newobj",
				"text" : "midiselect @note all @ch 6",
				"patching_rect" : [ 890.0, 90.0, 154.0, 22.0 ],
				"numoutlets" : 8,
				"outlettype" : [ "", "", "", "int", "int", "", "int", "int" ],
				"id" : "obj-18",
				"numinlets" : 1
			}

		}
, 		{
			"box" : 			{
				"maxclass" : "newobj",
				"text" : "midiselect @note all @ch 5",
				"patching_rect" : [ 716.0, 90.0, 154.0, 22.0 ],
				"numoutlets" : 8,
				"outlettype" : [ "", "", "", "int", "int", "", "int", "int" ],
				"id" : "obj-19",
				"numinlets" : 1
			}

		}
, 		{
			"box" : 			{
				"maxclass" : "newobj",
				"text" : "midiformat",
				"patching_rect" : [ 890.0, 161.0, 155.0, 23.0 ],
				"fontsize" : 13.0,
				"numoutlets" : 2,
				"fontname" : "Arial",
				"outlettype" : [ "int", "" ],
				"id" : "obj-20",
				"numinlets" : 7
			}

		}
, 		{
			"box" : 			{
				"maxclass" : "newobj",
				"text" : "midiformat",
				"patching_rect" : [ 1057.0, 161.0, 155.0, 23.0 ],
				"fontsize" : 13.0,
				"numoutlets" : 2,
				"fontname" : "Arial",
				"outlettype" : [ "int", "" ],
				"id" : "obj-21",
				"numinlets" : 7
			}

		}
, 		{
			"box" : 			{
				"maxclass" : "newobj",
				"text" : "midiformat",
				"patching_rect" : [ 716.0, 161.0, 155.0, 23.0 ],
				"fontsize" : 13.0,
				"numoutlets" : 2,
				"fontname" : "Arial",
				"outlettype" : [ "int", "" ],
				"id" : "obj-22",
				"numinlets" : 7
			}

		}
, 		{
			"box" : 			{
				"maxclass" : "newobj",
				"text" : "p Maj7Test",
				"patching_rect" : [ 103.0, 28.0, 67.0, 22.0 ],
				"numoutlets" : 4,
				"outlettype" : [ "", "", "", "" ],
				"id" : "obj-17",
				"numinlets" : 1,
				"patcher" : 				{
					"fileversion" : 1,
					"appversion" : 					{
						"major" : 9,
						"minor" : 0,
						"revision" : 0,
						"architecture" : "x64",
						"modernui" : 1
					}
,
					"classnamespace" : "box",
					"rect" : [ 59.0, 119.0, 1000.0, 755.0 ],
					"gridsize" : [ 15.0, 15.0 ],
					"boxes" : [ 						{
							"box" : 							{
								"maxclass" : "inlet",
								"patching_rect" : [ 50.0, 124.0, 30.0, 30.0 ],
								"numoutlets" : 1,
								"outlettype" : [ "" ],
								"id" : "obj-5",
								"numinlets" : 0,
								"comment" : "",
								"index" : 1
							}

						}
, 						{
							"box" : 							{
								"maxclass" : "outlet",
								"patching_rect" : [ 467.0, 339.0, 30.0, 30.0 ],
								"numoutlets" : 0,
								"id" : "obj-4",
								"numinlets" : 1,
								"comment" : "",
								"index" : 4
							}

						}
, 						{
							"box" : 							{
								"maxclass" : "outlet",
								"patching_rect" : [ 330.0, 339.0, 30.0, 30.0 ],
								"numoutlets" : 0,
								"id" : "obj-3",
								"numinlets" : 1,
								"comment" : "",
								"index" : 3
							}

						}
, 						{
							"box" : 							{
								"maxclass" : "outlet",
								"patching_rect" : [ 189.0, 343.0, 30.0, 30.0 ],
								"numoutlets" : 0,
								"id" : "obj-2",
								"numinlets" : 1,
								"comment" : "",
								"index" : 2
							}

						}
, 						{
							"box" : 							{
								"maxclass" : "outlet",
								"patching_rect" : [ 49.75, 343.0, 30.0, 30.0 ],
								"numoutlets" : 0,
								"id" : "obj-1",
								"numinlets" : 1,
								"comment" : "",
								"index" : 1
							}

						}
, 						{
							"box" : 							{
								"maxclass" : "newobj",
								"text" : "+ 11",
								"patching_rect" : [ 467.0, 172.0, 31.0, 22.0 ],
								"numoutlets" : 1,
								"outlettype" : [ "int" ],
								"id" : "obj-128",
								"numinlets" : 2
							}

						}
, 						{
							"box" : 							{
								"maxclass" : "newobj",
								"text" : "+ 7",
								"patching_rect" : [ 330.0, 172.0, 29.5, 22.0 ],
								"numoutlets" : 1,
								"outlettype" : [ "int" ],
								"id" : "obj-127",
								"numinlets" : 2
							}

						}
, 						{
							"box" : 							{
								"maxclass" : "newobj",
								"text" : "+ 4",
								"patching_rect" : [ 189.0, 172.0, 29.5, 22.0 ],
								"numoutlets" : 1,
								"outlettype" : [ "int" ],
								"id" : "obj-126",
								"numinlets" : 2
							}

						}
, 						{
							"box" : 							{
								"maxclass" : "newobj",
								"text" : "join",
								"patching_rect" : [ 467.0, 248.0, 29.5, 22.0 ],
								"numoutlets" : 1,
								"outlettype" : [ "" ],
								"id" : "obj-122",
								"numinlets" : 2
							}

						}
, 						{
							"box" : 							{
								"maxclass" : "newobj",
								"text" : "makenote 127 400",
								"patching_rect" : [ 467.0, 202.0, 108.0, 22.0 ],
								"numoutlets" : 2,
								"outlettype" : [ "float", "float" ],
								"id" : "obj-123",
								"numinlets" : 3
							}

						}
, 						{
							"box" : 							{
								"maxclass" : "newobj",
								"text" : "join",
								"patching_rect" : [ 330.0, 248.0, 29.5, 22.0 ],
								"numoutlets" : 1,
								"outlettype" : [ "" ],
								"id" : "obj-120",
								"numinlets" : 2
							}

						}
, 						{
							"box" : 							{
								"maxclass" : "newobj",
								"text" : "makenote 127 400",
								"patching_rect" : [ 330.0, 202.0, 108.0, 22.0 ],
								"numoutlets" : 2,
								"outlettype" : [ "float", "float" ],
								"id" : "obj-121",
								"numinlets" : 3
							}

						}
, 						{
							"box" : 							{
								"maxclass" : "newobj",
								"text" : "join",
								"patching_rect" : [ 189.0, 248.0, 29.5, 22.0 ],
								"numoutlets" : 1,
								"outlettype" : [ "" ],
								"id" : "obj-118",
								"numinlets" : 2
							}

						}
, 						{
							"box" : 							{
								"maxclass" : "newobj",
								"text" : "makenote 127 400",
								"patching_rect" : [ 189.0, 202.0, 108.0, 22.0 ],
								"numoutlets" : 2,
								"outlettype" : [ "float", "float" ],
								"id" : "obj-119",
								"numinlets" : 3
							}

						}
, 						{
							"box" : 							{
								"maxclass" : "newobj",
								"text" : "join",
								"patching_rect" : [ 50.0, 248.0, 29.5, 22.0 ],
								"numoutlets" : 1,
								"outlettype" : [ "" ],
								"id" : "obj-76",
								"numinlets" : 2
							}

						}
, 						{
							"box" : 							{
								"maxclass" : "newobj",
								"text" : "makenote 127 400",
								"patching_rect" : [ 50.0, 202.0, 108.0, 22.0 ],
								"numoutlets" : 2,
								"outlettype" : [ "float", "float" ],
								"id" : "obj-73",
								"numinlets" : 3
							}

						}
 ],
					"lines" : [ 						{
							"patchline" : 							{
								"source" : [ "obj-76", 0 ],
								"destination" : [ "obj-1", 0 ]
							}

						}
, 						{
							"patchline" : 							{
								"source" : [ "obj-73", 0 ],
								"destination" : [ "obj-76", 0 ]
							}

						}
, 						{
							"patchline" : 							{
								"source" : [ "obj-73", 1 ],
								"destination" : [ "obj-76", 1 ]
							}

						}
, 						{
							"patchline" : 							{
								"source" : [ "obj-5", 0 ],
								"destination" : [ "obj-73", 0 ],
								"order" : 3
							}

						}
, 						{
							"patchline" : 							{
								"source" : [ "obj-5", 0 ],
								"destination" : [ "obj-128", 0 ],
								"order" : 0
							}

						}
, 						{
							"patchline" : 							{
								"source" : [ "obj-5", 0 ],
								"destination" : [ "obj-127", 0 ],
								"order" : 1
							}

						}
, 						{
							"patchline" : 							{
								"source" : [ "obj-5", 0 ],
								"destination" : [ "obj-126", 0 ],
								"order" : 2
							}

						}
, 						{
							"patchline" : 							{
								"source" : [ "obj-128", 0 ],
								"destination" : [ "obj-123", 0 ]
							}

						}
, 						{
							"patchline" : 							{
								"source" : [ "obj-127", 0 ],
								"destination" : [ "obj-121", 0 ]
							}

						}
, 						{
							"patchline" : 							{
								"source" : [ "obj-126", 0 ],
								"destination" : [ "obj-119", 0 ]
							}

						}
, 						{
							"patchline" : 							{
								"source" : [ "obj-123", 0 ],
								"destination" : [ "obj-122", 0 ]
							}

						}
, 						{
							"patchline" : 							{
								"source" : [ "obj-123", 1 ],
								"destination" : [ "obj-122", 1 ]
							}

						}
, 						{
							"patchline" : 							{
								"source" : [ "obj-122", 0 ],
								"destination" : [ "obj-4", 0 ]
							}

						}
, 						{
							"patchline" : 							{
								"source" : [ "obj-121", 0 ],
								"destination" : [ "obj-120", 0 ]
							}

						}
, 						{
							"patchline" : 							{
								"source" : [ "obj-121", 1 ],
								"destination" : [ "obj-120", 1 ]
							}

						}
, 						{
							"patchline" : 							{
								"source" : [ "obj-120", 0 ],
								"destination" : [ "obj-3", 0 ]
							}

						}
, 						{
							"patchline" : 							{
								"source" : [ "obj-119", 0 ],
								"destination" : [ "obj-118", 0 ]
							}

						}
, 						{
							"patchline" : 							{
								"source" : [ "obj-119", 1 ],
								"destination" : [ "obj-118", 1 ]
							}

						}
, 						{
							"patchline" : 							{
								"source" : [ "obj-118", 0 ],
								"destination" : [ "obj-2", 0 ]
							}

						}
 ],
					"originid" : "pat-6"
				}
,
				"saved_object_attributes" : 				{
					"globalpatchername" : ""
				}

			}

		}
, 		{
			"box" : 			{
				"maxclass" : "message",
				"text" : "55 0",
				"patching_rect" : [ 575.0, 126.0, 50.0, 22.0 ],
				"numoutlets" : 1,
				"outlettype" : [ "" ],
				"id" : "obj-14",
				"numinlets" : 2
			}

		}
, 		{
			"box" : 			{
				"maxclass" : "message",
				"text" : "52 0",
				"patching_rect" : [ 405.0, 126.0, 50.0, 22.0 ],
				"numoutlets" : 1,
				"outlettype" : [ "" ],
				"id" : "obj-13",
				"numinlets" : 2
			}

		}
, 		{
			"box" : 			{
				"maxclass" : "message",
				"text" : "64 0",
				"patching_rect" : [ 226.0, 126.0, 50.0, 22.0 ],
				"numoutlets" : 1,
				"outlettype" : [ "" ],
				"id" : "obj-12",
				"numinlets" : 2
			}

		}
, 		{
			"box" : 			{
				"maxclass" : "message",
				"text" : "67 0",
				"patching_rect" : [ 63.0, 126.0, 50.0, 22.0 ],
				"numoutlets" : 1,
				"outlettype" : [ "" ],
				"id" : "obj-11",
				"numinlets" : 2
			}

		}
, 		{
			"box" : 			{
				"maxclass" : "newobj",
				"text" : "loadmess 4",
				"patching_rect" : [ 633.0, 126.0, 70.0, 22.0 ],
				"numoutlets" : 1,
				"outlettype" : [ "" ],
				"id" : "obj-5",
				"numinlets" : 1
			}

		}
, 		{
			"box" : 			{
				"maxclass" : "newobj",
				"text" : "loadmess 3",
				"patching_rect" : [ 466.0, 126.0, 70.0, 22.0 ],
				"numoutlets" : 1,
				"outlettype" : [ "" ],
				"id" : "obj-4",
				"numinlets" : 1
			}

		}
, 		{
			"box" : 			{
				"maxclass" : "newobj",
				"text" : "loadmess 2",
				"patching_rect" : [ 292.0, 126.0, 70.0, 22.0 ],
				"numoutlets" : 1,
				"outlettype" : [ "" ],
				"id" : "obj-3",
				"numinlets" : 1
			}

		}
, 		{
			"box" : 			{
				"maxclass" : "newobj",
				"text" : "loadmess 1",
				"patching_rect" : [ 125.0, 126.0, 70.0, 22.0 ],
				"numoutlets" : 1,
				"outlettype" : [ "" ],
				"id" : "obj-2",
				"numinlets" : 1
			}

		}
, 		{
			"box" : 			{
				"maxclass" : "newobj",
				"text" : "midiselect @note all @ch 4",
				"patching_rect" : [ 548.0, 90.0, 154.0, 22.0 ],
				"numoutlets" : 8,
				"outlettype" : [ "", "", "", "int", "int", "", "int", "int" ],
				"id" : "obj-181",
				"numinlets" : 1
			}

		}
, 		{
			"box" : 			{
				"maxclass" : "newobj",
				"text" : "midiselect @note all @ch 3",
				"patching_rect" : [ 381.0, 90.0, 154.0, 22.0 ],
				"numoutlets" : 8,
				"outlettype" : [ "", "", "", "int", "int", "", "int", "int" ],
				"id" : "obj-184",
				"numinlets" : 1
			}

		}
, 		{
			"box" : 			{
				"maxclass" : "newobj",
				"text" : "midiselect @note all @ch 2",
				"patching_rect" : [ 207.0, 90.0, 154.0, 22.0 ],
				"numoutlets" : 8,
				"outlettype" : [ "", "", "", "int", "int", "", "int", "int" ],
				"id" : "obj-178",
				"numinlets" : 1
			}

		}
, 		{
			"box" : 			{
				"maxclass" : "newobj",
				"text" : "midiselect @note all @ch 1",
				"patching_rect" : [ 40.0, 90.0, 154.0, 22.0 ],
				"numoutlets" : 8,
				"outlettype" : [ "", "", "", "int", "int", "", "int", "int" ],
				"id" : "obj-167",
				"numinlets" : 1
			}

		}
, 		{
			"box" : 			{
				"maxclass" : "newobj",
				"text" : "midiin",
				"patching_rect" : [ 40.0, 28.0, 40.0, 22.0 ],
				"numoutlets" : 1,
				"outlettype" : [ "int" ],
				"id" : "obj-164",
				"numinlets" : 1
			}

		}
, 		{
			"box" : 			{
				"maxclass" : "message",
				"text" : "port z",
				"patching_rect" : [ 237.0, 274.0, 39.0, 22.0 ],
				"numoutlets" : 1,
				"outlettype" : [ "" ],
				"id" : "obj-163",
				"numinlets" : 2
			}

		}
, 		{
			"box" : 			{
				"maxclass" : "message",
				"text" : "port b",
				"patching_rect" : [ 197.0, 274.0, 39.0, 22.0 ],
				"numoutlets" : 1,
				"outlettype" : [ "" ],
				"id" : "obj-160",
				"numinlets" : 2
			}

		}
, 		{
			"box" : 			{
				"maxclass" : "message",
				"text" : "print",
				"patching_rect" : [ 163.0, 274.0, 32.0, 22.0 ],
				"numoutlets" : 1,
				"outlettype" : [ "" ],
				"id" : "obj-130",
				"numinlets" : 2
			}

		}
, 		{
			"box" : 			{
				"maxclass" : "newobj",
				"text" : "midiformat",
				"patching_rect" : [ 381.0, 161.0, 155.0, 23.0 ],
				"fontsize" : 13.0,
				"numoutlets" : 2,
				"fontname" : "Arial",
				"outlettype" : [ "int", "" ],
				"id" : "obj-97",
				"numinlets" : 7
			}

		}
, 		{
			"box" : 			{
				"maxclass" : "newobj",
				"text" : "midiformat",
				"patching_rect" : [ 548.0, 161.0, 155.0, 23.0 ],
				"fontsize" : 13.0,
				"numoutlets" : 2,
				"fontname" : "Arial",
				"outlettype" : [ "int", "" ],
				"id" : "obj-98",
				"numinlets" : 7
			}

		}
, 		{
			"box" : 			{
				"maxclass" : "newobj",
				"text" : "midiformat",
				"patching_rect" : [ 40.0, 161.0, 155.0, 23.0 ],
				"fontsize" : 13.0,
				"numoutlets" : 2,
				"fontname" : "Arial",
				"outlettype" : [ "int", "" ],
				"id" : "obj-91",
				"numinlets" : 7
			}

		}
, 		{
			"box" : 			{
				"maxclass" : "newobj",
				"text" : "print status @popup 1",
				"patching_rect" : [ 114.0, 345.0, 138.0, 23.0 ],
				"fontsize" : 13.0,
				"numoutlets" : 0,
				"fontname" : "Arial",
				"id" : "obj-28",
				"numinlets" : 1
			}

		}
, 		{
			"box" : 			{
				"maxclass" : "newobj",
				"text" : "midiformat",
				"patching_rect" : [ 207.0, 161.0, 155.0, 23.0 ],
				"fontsize" : 13.0,
				"numoutlets" : 2,
				"fontname" : "Arial",
				"outlettype" : [ "int", "" ],
				"id" : "obj-23",
				"numinlets" : 7
			}

		}
, 		{
			"box" : 			{
				"maxclass" : "newobj",
				"text" : "serial b 115200",
				"patching_rect" : [ 43.0, 308.0, 90.0, 22.0 ],
				"numoutlets" : 2,
				"outlettype" : [ "int", "" ],
				"id" : "obj-1",
				"numinlets" : 1
			}

		}
 ],
	"lines" : [ 		{
			"patchline" : 			{
				"source" : [ "obj-98", 0 ],
				"destination" : [ "obj-1", 0 ]
			}

		}
, 		{
			"patchline" : 			{
				"source" : [ "obj-97", 0 ],
				"destination" : [ "obj-1", 0 ]
			}

		}
, 		{
			"patchline" : 			{
				"source" : [ "obj-91", 0 ],
				"destination" : [ "obj-1", 0 ]
			}

		}
, 		{
			"patchline" : 			{
				"source" : [ "obj-9", 0 ],
				"destination" : [ "obj-21", 6 ]
			}

		}
, 		{
			"patchline" : 			{
				"source" : [ "obj-5", 0 ],
				"destination" : [ "obj-98", 6 ]
			}

		}
, 		{
			"patchline" : 			{
				"source" : [ "obj-4", 0 ],
				"destination" : [ "obj-97", 6 ]
			}

		}
, 		{
			"patchline" : 			{
				"source" : [ "obj-3", 0 ],
				"destination" : [ "obj-23", 6 ]
			}

		}
, 		{
			"patchline" : 			{
				"source" : [ "obj-23", 0 ],
				"destination" : [ "obj-1", 0 ]
			}

		}
, 		{
			"patchline" : 			{
				"source" : [ "obj-22", 0 ],
				"destination" : [ "obj-1", 0 ]
			}

		}
, 		{
			"patchline" : 			{
				"source" : [ "obj-21", 0 ],
				"destination" : [ "obj-1", 0 ]
			}

		}
, 		{
			"patchline" : 			{
				"source" : [ "obj-20", 0 ],
				"destination" : [ "obj-1", 0 ]
			}

		}
, 		{
			"patchline" : 			{
				"source" : [ "obj-2", 0 ],
				"destination" : [ "obj-91", 6 ]
			}

		}
, 		{
			"patchline" : 			{
				"source" : [ "obj-19", 0 ],
				"destination" : [ "obj-8", 1 ],
				"order" : 0
			}

		}
, 		{
			"patchline" : 			{
				"source" : [ "obj-19", 0 ],
				"destination" : [ "obj-22", 0 ],
				"order" : 1
			}

		}
, 		{
			"patchline" : 			{
				"source" : [ "obj-184", 0 ],
				"destination" : [ "obj-97", 0 ],
				"order" : 1
			}

		}
, 		{
			"patchline" : 			{
				"source" : [ "obj-184", 0 ],
				"destination" : [ "obj-13", 1 ],
				"order" : 0
			}

		}
, 		{
			"patchline" : 			{
				"source" : [ "obj-181", 0 ],
				"destination" : [ "obj-98", 0 ],
				"order" : 1
			}

		}
, 		{
			"patchline" : 			{
				"source" : [ "obj-181", 0 ],
				"destination" : [ "obj-14", 1 ],
				"order" : 0
			}

		}
, 		{
			"patchline" : 			{
				"source" : [ "obj-18", 0 ],
				"destination" : [ "obj-7", 1 ],
				"order" : 0
			}

		}
, 		{
			"patchline" : 			{
				"source" : [ "obj-18", 0 ],
				"destination" : [ "obj-20", 0 ],
				"order" : 1
			}

		}
, 		{
			"patchline" : 			{
				"source" : [ "obj-178", 0 ],
				"destination" : [ "obj-23", 0 ],
				"order" : 1
			}

		}
, 		{
			"patchline" : 			{
				"source" : [ "obj-178", 0 ],
				"destination" : [ "obj-12", 1 ],
				"order" : 0
			}

		}
, 		{
			"patchline" : 			{
				"source" : [ "obj-167", 0 ],
				"destination" : [ "obj-91", 0 ],
				"order" : 1
			}

		}
, 		{
			"patchline" : 			{
				"source" : [ "obj-167", 0 ],
				"destination" : [ "obj-11", 1 ],
				"order" : 0
			}

		}
, 		{
			"patchline" : 			{
				"source" : [ "obj-164", 0 ],
				"destination" : [ "obj-19", 0 ],
				"order" : 2
			}

		}
, 		{
			"patchline" : 			{
				"source" : [ "obj-164", 0 ],
				"destination" : [ "obj-184", 0 ],
				"order" : 4
			}

		}
, 		{
			"patchline" : 			{
				"source" : [ "obj-164", 0 ],
				"destination" : [ "obj-181", 0 ],
				"order" : 3
			}

		}
, 		{
			"patchline" : 			{
				"source" : [ "obj-164", 0 ],
				"destination" : [ "obj-18", 0 ],
				"order" : 1
			}

		}
, 		{
			"patchline" : 			{
				"source" : [ "obj-164", 0 ],
				"destination" : [ "obj-178", 0 ],
				"order" : 5
			}

		}
, 		{
			"patchline" : 			{
				"source" : [ "obj-164", 0 ],
				"destination" : [ "obj-167", 0 ],
				"order" : 6
			}

		}
, 		{
			"patchline" : 			{
				"source" : [ "obj-164", 0 ],
				"destination" : [ "obj-16", 0 ],
				"order" : 0
			}

		}
, 		{
			"patchline" : 			{
				"source" : [ "obj-163", 0 ],
				"destination" : [ "obj-1", 0 ]
			}

		}
, 		{
			"patchline" : 			{
				"source" : [ "obj-160", 0 ],
				"destination" : [ "obj-1", 0 ]
			}

		}
, 		{
			"patchline" : 			{
				"source" : [ "obj-16", 0 ],
				"destination" : [ "obj-6", 1 ],
				"order" : 0
			}

		}
, 		{
			"patchline" : 			{
				"source" : [ "obj-16", 0 ],
				"destination" : [ "obj-21", 0 ],
				"order" : 1
			}

		}
, 		{
			"patchline" : 			{
				"source" : [ "obj-15", 0 ],
				"destination" : [ "obj-22", 6 ]
			}

		}
, 		{
			"patchline" : 			{
				"source" : [ "obj-130", 0 ],
				"destination" : [ "obj-1", 0 ]
			}

		}
, 		{
			"patchline" : 			{
				"source" : [ "obj-10", 0 ],
				"destination" : [ "obj-20", 6 ]
			}

		}
, 		{
			"patchline" : 			{
				"source" : [ "obj-1", 1 ],
				"destination" : [ "obj-28", 0 ]
			}

		}
 ],
	"appversion" : 	{
		"major" : 9,
		"minor" : 0,
		"revision" : 0,
		"architecture" : "x64",
		"modernui" : 1
	}
,
	"classnamespace" : "box"
}
