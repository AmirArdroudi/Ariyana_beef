using System;
using System.Collections;

namespace ari
{
	[CRepr]
	public struct AudioSourceHandle
	{
		public uint32 Handle = uint32.MaxValue;
		public uint32 Index = uint32.MaxValue;

		[CLink]
		static extern bool IsValidAudio(ref uint32 _entityHandle);

		public bool IsValid() mut
		{
			if(Handle == uint32.MaxValue || Index == uint32.MaxValue)
				return false;
			return IsValidAudio(ref Handle);
		}
	}

	[CRepr]
	public struct ChannelHandle
	{
		public uint32 Handle = uint32.MaxValue;
		public uint32 Index = uint32.MaxValue;

		[CLink]
		static extern bool IsValidChannel(ref uint32 _entityHandle);

		public bool IsValid() mut
		{
			if(Handle == uint32.MaxValue || Index == uint32.MaxValue)
				return false;
			return IsValidChannel(ref Handle);
		}
	}

	public static class Sfx
	{
		[CLink]
		public static extern void InitSfx();
		
		[CLink]
		public static extern void ShutdownSfx();

		[CLink]
		public static extern ChannelHandle Play(void* _audio);
		[CLink]
		public static extern AudioSourceHandle LoadAudioSource(char8 * path);
	}	
}
