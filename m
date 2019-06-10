Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with ESMTP id 3066D6D409
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2019 12:21:40 +0000 (UTC)
Received: (qmail 890 invoked by uid 1003); 10 Jun 2019 12:21:40 -0000
Received: from unknown (HELO ?172.20.2.92?) (philip@opensdr.com@38.90.133.135)
	by mail.geekisp.com with (ECDHE-RSA-AES128-GCM-SHA256 encrypted)
	SMTP; 10 Jun 2019 12:21:40 -0000
References: <A084970538D2234B96D99D06FA9D974FC37CEE23@ALA-MBD.corp.ad.wrs.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
From: Philip Balister <philip@balister.org>
Openpgp: preference=signencrypt
Autocrypt: addr=philip@balister.org; prefer-encrypt=mutual; keydata=
	xsBNBE6PN4EBCADXwOSVOvTrJ370tH2RmiR22OuCBcKfnKTLztyV5zA0veDB1kmrIajh+sJe
	HWNqsib0v19S3wdrvqzKrztSfNAgUctvkAuTOloU81dmbAjDSge6nFxjzIIz6XjNvmP5xl9J
	rstPm4i4dhAs5436xf4Bh0vn3C/Bp4fKwXBSW/Xto7vuiuSK03ojon3F8O2WNEmKxHyubFP1
	2tNvXOp/PeAR4LTnYq6fdAAofvbpbPDBg8qICe6j1UXaIyU93IbW+bJp1RFbeakWxiTw+eQ2
	fVjG5XnubNX0YBlmjHDJhjeqV1uwkImNHlZknecLjT7g37vIMwz+PTfPIhmIGffzqtHlABEB
	AAHNJVBoaWxpcCBCYWxpc3RlciA8cGhpbGlwQGJhbGlzdGVyLm9yZz7CwH4EEwECACgCGyMG
	CwkIBwMCBhUIAgkKCwQWAgMBAh4BAheABQJYM1D9BQkRKOdqAAoJEMDJd4rr0merDX4H/3Pr
	nYKDnml7LRiikoOTFJb4r7ub04skrkGI2DAYvRUPH110KXaan84Qo2Yl4r/ma15Lpqx+cdPR
	3KbFlSWyjgY6CMN/BclutsK4mFkoxnmhdYJvc5M2TDfZLxBPMTeQiHo0MwxUB5v81mv812bx
	YKfEOg3ndk7C/TE0Q8ZER7p6fU3ol/e0ilLyaCpd85nkEcOEI7BdBBGhKWii+Cwvv8g2ofQZ
	3wAsqQFp7PFxlEjo5Xc1QGqo7L+UlDG23QjUn33n+wZMZm9EUZFu1c1MAGZsvXiqKw8P07Mj
	yyf6h6EMVP8wME7gnkxsZkpKv04mSvKpDLIInmRW9ZlHXaJ4YxjOwE0ETo83gQEIAPs+ZC0R
	gF4blrRIiVHdkARncAxUwSUbti5Ku23dQ0iBizozh4YGucgW48gxsvJCkCc9s/4C9e3vYiCZ
	GVGC8x6Ll3vE7xwRQ/euVqJ0mXG7tNK1zAPpSgI6aooPSZCW7PBvwY8uMvzzCzP+EBd0+oA5
	uXQSEcyOJUYy4beferoHUiBjBkyNd+v2iaJf7KjAYYxJOcPvtnq/VL09hlmtCD5zghOn80rt
	LqF66BJkHmATopSWyor1qz7gmowdCkFkUJDNW7yJT1wVANqDd9P5A8vYhngwJTHsvXVftmvB
	gLiJjYuKst36G2AOHgm4ls5jRMa/k7jWue1RKM5LxzgBtLUAEQEAAcLAZQQYAQIADwIbDAUC
	WDNRbAUJESjn5AAKCRDAyXeK69Jnq1qYB/93aiBdenAuu0H/zGWEFFB14cdhDR4S4q0EbfXl
	1z9o3Irazw6WMtLe12zJ4/Xl41Mh/IH8/+AgDnigisrkKRN1TkiOGDUVnS0akkhML3ONbeFd
	ocYEwBAPDTxAaWNoyjDe/bORokSJn31cFoG6QYyzUct79npHorbaXW0zW+KC77Do53yUKQ8+
	icWpfiCMk1YzSHCr0y5NZNVxac9a0+IDzH/YBbNdJLNaMvXcuege1Qqz85pdR0P4XuCVRD2j
	ZAbcGJzZXlu9ZzpIHjtZoyF8paJRMQwzWEO3/Txksmm7K8eu8Tz2JVpjiOIj44MOTKoRGKjO
	6eUfr0u7CwnEyqiQ
X-Forwarded-Message-Id: <A084970538D2234B96D99D06FA9D974FC37CEE23@ALA-MBD.corp.ad.wrs.com>
Message-ID: <9d4f1478-434d-1671-7039-417f1d624ac0@balister.org>
Date: Mon, 10 Jun 2019 08:21:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <A084970538D2234B96D99D06FA9D974FC37CEE23@ALA-MBD.corp.ad.wrs.com>
Subject: [yocto] Yocto Project DevDay NA 2019 - Extend your Embedded Linux Conference Experience
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Jun 2019 12:21:40 -0000
X-Groupsio-MsgNum: 125589
Content-Type: multipart/mixed; boundary="------------3FD629A5F084066EC4A3EFA9"
Content-Language: en-MW

--------------3FD629A5F084066EC4A3EFA9
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

FYI

-------- Forwarded Message --------
Subject: [yocto] Yocto Project DevDay NA 2019 - Extend your Embedded
Linux Conference Experience
Date: Tue, 4 Jun 2019 19:39:08 +0000
From: Volosincu, Andreea S <andreea.volosincu@windriver.com>
To: Yocto list discussion <yocto@yoctoproject.org>

Hello Everybody,

The registration for the Yocto Project DevDay NA 2019 is now open. Join
our knowledgeable and engaging instructors to learn about creating
custom-build Linux distributions using the Yocto Project infrastructure
and tools, across multiple architectures.

Date: Tuesday, August 20, 2019
Time: 9:00 am - 5:00 pm
Location: Hilton San Diego Bayfront

There are two ways to register - by adding it your ELC registration or
on the separate registration page.

Register now.
<https://www.yoctoproject.org/yocto-project-dev-day-north-america-2019/>

Best regards,
Yocto Project Advocacy Team



--------------3FD629A5F084066EC4A3EFA9
Content-Type: text/plain; charset=UTF-8;
 name="Attached Message Part"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="Attached Message Part"

-- 
_______________________________________________
yocto mailing list
yocto@yoctoproject.org
https://lists.yoctoproject.org/listinfo/yocto


--------------3FD629A5F084066EC4A3EFA9--
