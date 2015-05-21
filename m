Return-Path: <changhyeok.bae@lge.com>
Received: from lgeamrelo02.lge.com (lgeamrelo02.lge.com [156.147.1.126])
	by mail.openembedded.org (Postfix) with ESMTP id 975576B0CB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 00:05:58 +0000 (UTC)
Received: from unknown (HELO CHBae0915) (10.177.222.197)
	by 156.147.1.126 with ESMTP; 21 May 2015 09:05:59 +0900
X-Original-SENDERIP: 10.177.222.197
X-Original-MAILFROM: changhyeok.bae@lge.com
From: "Changhyeok Bae" <changhyeok.bae@lge.com>
To: =?UTF-8?Q?'Andreas_M=C3=BCller'?= <schnitzeltony@googlemail.com>,
	"'Burton, Ross'" <ross.burton@intel.com>,
	"'OE-core'" <openembedded-core@lists.openembedded.org>,
	"Tomas Frydrych" <tf+lists.yocto@r-finger.com>, <martin.jansa@gmail.com>
References: <20150312143521.GD2338@jama>	<5501D4CA.2090209@r-finger.com>	<08f401d08df0$aba9be00$02fd3a00$@lge.com>	<CALbNGRReufGQXfR3eYqQKN6CRwhcEk5-EaeTfctenBdWeoYm_w@mail.gmail.com>	<CAJTo0La7EummgKK7-dp7oubo4XV_-yjn0WMbAysDJN4Btmah2A@mail.gmail.com>
	<CALbNGRQzOdn8mGX-8E+7f9RLttmnESqjBw86v2pV4KOJhxpEmQ@mail.gmail.com>
In-Reply-To: <CALbNGRQzOdn8mGX-8E+7f9RLttmnESqjBw86v2pV4KOJhxpEmQ@mail.gmail.com>
Date: Thu, 21 May 2015 09:06:01 +0900
Message-ID: <0ba801d09359$ec479130$c4d6b390$@lge.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQFJJzd33wMNl4fFEeoeYEhR/UHxBgHlFIsNAvfvmBMB68tUHQDnnVY9Am5MtZ+eQ28HYA==
Cc: =?UTF-8?B?7J2066qF6rWs?= <myonggu.lee@lge.com>
Subject: Re: meta-gir issues and maintenance
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
X-List-Received-Date: Thu, 21 May 2015 00:06:00 -0000
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Content-Language: ko

I forked meta-gir to https://github.com/locust2001/meta-gir and start =
working from next week.

-----Original Message-----
From: Andreas M=C3=BCller [mailto:schnitzeltony@googlemail.com]=20
Sent: Monday, May 18, 2015 8:46 PM
To: Burton, Ross
Cc: Changhyeok Bae; OE-core
Subject: Re: [OE-core] meta-gir issues and maintenance

On Mon, May 18, 2015 at 1:00 PM, Burton, Ross <ross.burton@intel.com> =
wrote:
> On 18 May 2015 at 09:00, Andreas M=C3=BCller =
<schnitzeltony@googlemail.com>
> wrote:
>>
>> I would appreciate to have the gintrospection more central - this=20
>> would give us a chance to get the gtk stuff out of stone age..
>
>
> Well, oe-core already has GTK+ 3, so we're "just" missing the bindings =

> to Python and JavaScript.
Sorry - I meant gnome not gtk.
>
> Changhyeok, you're welcome to fork meta-gir to your own repository and =

> work on it independently.  If you can update it so that it works with=20
> oe-core master then you're the new maintainer. :)
>
Andreas

This email has been protected by YAC (Yet Another Cleaner) http://www.yac.mx

