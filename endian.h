#ifndef PLOCATE_ENDIAN_H
#define PLOCATE_ENDIAN_H

#include <stdint.h>

template<class T>
inline T host_to_little_endian(T value)
{
#if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
	if constexpr (sizeof(T) == 2) {
		return static_cast<T>(__builtin_bswap16(static_cast<uint16_t>(value)));
	} else if constexpr (sizeof(T) == 4) {
		return static_cast<T>(__builtin_bswap32(static_cast<uint32_t>(value)));
	} else if constexpr (sizeof(T) == 8) {
		return static_cast<T>(__builtin_bswap64(static_cast<uint64_t>(value)));
	} else {
		return value;
	}
#else
	return value;
#endif
}

template<class T>
inline T little_endian_to_host(T value)
{
	return host_to_little_endian(value);
}

#endif
