Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RvCdp-0006Ks-Pj
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Feb 2012 19:53:18 +0100
Received: from mail-iy0-f180.google.com ([209.85.210.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 08 Feb 2012 10:45:12 -0800
Received: by iabz7 with SMTP id z7so1583698iab.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Feb 2012 10:45:12 -0800 (PST)
Received: by 10.50.203.66 with SMTP id ko2mr34044735igc.7.1328726712183;
	Wed, 08 Feb 2012 10:45:12 -0800 (PST)
Received: from [10.6.18.245] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id r18sm40701ibh.4.2012.02.08.10.45.09
	(version=SSLv3 cipher=OTHER); Wed, 08 Feb 2012 10:45:10 -0800 (PST)
Message-ID: <4F32C2B3.7020200@intel.com>
Date: Wed, 08 Feb 2012 10:45:07 -0800
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: "Osier-mixon, Jeffrey" <jeffrey.osier-mixon@intel.com>
References: <4F323C52.8030304@intel.com>
	<CDED78A957032E45B3239CDDA7642D1508437968@ORSMSX105.amr.corp.intel.com>
	<CALZ2gZX3LMTcJ11qg5T7RAJRGpcR3fE0YB2cWMbmXPzo3Vpqqg@mail.gmail.com>
	<CAMKF1spwxYzxRM2NbYfaU_GLXqjBtuXi5kO_Up6t2MS1zREi4g@mail.gmail.com>
	<CALZ2gZWmpnhxg=aa3qLbrpQLJqfgOn2W5WH0369rdHqyKqaD-A@mail.gmail.com>
In-Reply-To: <CALZ2gZWmpnhxg=aa3qLbrpQLJqfgOn2W5WH0369rdHqyKqaD-A@mail.gmail.com>
Cc: Yocto Project Discussion <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, "Stewart,
	David C" <david.c.stewart@intel.com>
Subject: Re: [yocto] Upstream-Status finally @ 100%
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Feb 2012 18:53:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/08/2012 10:04 AM, Osier-mixon, Jeffrey wrote:
> Ah, documentation :)  excellent
>

Jefro:

You can get more info about this from Mark's OE page:
http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

The Key thing to note on my numbers is that we have 461 patches that 
could potentially be up-streamed to other communities, depending the 
status of those communities, from active communities accepting patches 
to upstream source that is just download-able with no activity or 
maintainers.

We have 1243 patches overall, which include OE Specific configuration 
patches and Embedded specific tweaks to various upstreams that may not 
be appropriate or acceptable to the upstream community.

Sau!




> On Wed, Feb 8, 2012 at 9:45 AM, Khem Raj <raj.khem@gmail.com
> <mailto:raj.khem@gmail.com>> wrote:
>
>     On Wed, Feb 8, 2012 at 9:34 AM, Osier-mixon, Jeffrey
>     <jeffrey.osier-mixon@intel.com
>     <mailto:jeffrey.osier-mixon@intel.com>> wrote:
>      > This sounds fantastic, and I'd love to create a page on the website
>      > reflecting this. Just so I am clear, what exactly is this 100%
>     of? Do we
>      > have no local patches to upstream projects at all?
>
>     it means that all patches have a field 'Upstream-Status'
>     and for most of them it reflects the status of patch w.r.t. upstream
>     of given package
>
>
>
>
> --
> Jeff Osier-Mixon http://jefro.net/blog
> Yocto Project Community Manager @Intel http://yoctoproject.org
> <http://yoctoproject.org/>
>



