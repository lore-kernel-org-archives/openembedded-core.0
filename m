Received: from mail-we0-f179.google.com ([74.125.82.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>)
	id 1UWA3e-0003f9-QD; Sat, 27 Apr 2013 20:41:15 +0200
Received: by mail-we0-f179.google.com with SMTP id u7so694073wey.38
	for <multiple recipients>; Sat, 27 Apr 2013 11:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=epEqIx/QMgVdXlM9B7GlqtvHAWetrIUyKUwgB1odYR0=;
	b=0SQpm0Leu9xA/G4GnBE7Ps3CuZ2Eo2kennjs0yc7OKOVIYHhP+WT4GgPQg0PQNhaLs
	qYilyMWVzjArQueuUuzeKhu3MPRZKZXpAJa2zBAfwvwNv6HsVPXqr2lHEILlDKaaM8oG
	oFiWSc0hq81eW5CJcyBee6JbLWmZfany7npA9eZFK9bIzUuVKLHHR5cgiexjJ3rJUj4o
	3o7dsetTG06taZKTbvgEpqyvLh+jogT3xBZnxD980NjoGGVkZQbyu0iYFJ1sFKh0/z46
	E3icIgH3m9Y5BZT7xuy2SMzazwyE3zv1ecZaDxh72sXT2+tmiCGxieFLOxF/NMzevowv
	Fa0w==
MIME-Version: 1.0
X-Received: by 10.194.122.7 with SMTP id lo7mr66430424wjb.48.1367087006999;
	Sat, 27 Apr 2013 11:23:26 -0700 (PDT)
Received: by 10.216.211.131 with HTTP; Sat, 27 Apr 2013 11:23:26 -0700 (PDT)
In-Reply-To: <924E0E65-7A58-4F98-84F0-0A04BC9F2C23@gmail.com>
References: <20121213174202.GE3356@jama.jama.net>
	<20130415141253.GC10628@jama.dyndns-home.com>
	<20130427105400.GB3199@jama> <1505854.4Uj52mcVBD@helios>
	<924E0E65-7A58-4F98-84F0-0A04BC9F2C23@gmail.com>
Date: Sat, 27 Apr 2013 20:23:26 +0200
Message-ID: <CALbNGRTtwRSzpGtQuuKhSzST3dxALZObNPtVEXan-+-O5YV8dw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [oe] State of bitbake world
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 27 Apr 2013 18:41:20 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Apr 27, 2013 at 7:18 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Apr 27, 2013, at 4:23 AM, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
>
>> On Saturday 27 April 2013 12:54:00 Martin Jansa wrote:
>>> common (8):
>>>  I'll send patches moving qcanobserver, gcalctool, media-ctl, xbmc to
>>> nonworking
>>
>> If we have this number of recipes failing, I think we need to do more than
>> just move them to nonworking. Could we perhaps try to have an organised effort
>> to fix up these broken recipes? I'll be happy to help out.
>>
>
> something like recipe build fix weekend blitz
>
Will look into gnome recipes.

Andreas


