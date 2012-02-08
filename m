Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RvBi7-0004Wb-2B
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Feb 2012 18:53:39 +0100
Received: by lahc1 with SMTP id c1so733258lah.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Feb 2012 09:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=nqhStqimZ9qQsy17GjlxowEMTuP7vOru0JuhBcB5iGQ=;
	b=xjlfeUxBimwuzPXfHEIQszFWkV7RImzWTQ4SZn+aLcwU2YzNjRYQ+D0NSmANBGvfQw
	hRdx94ksA7pyexgBgRmW1sgRvfspK6aKK3nyCjz+o0rwf9H8/Pz2McSZwl4QpscO1+KS
	qu/wVTRa4YNdIl6dSKxJJExUVO/gp6J6NoAJY=
Received: by 10.112.32.1 with SMTP id e1mr8380640lbi.3.1328723135272; Wed, 08
	Feb 2012 09:45:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Wed, 8 Feb 2012 09:45:05 -0800 (PST)
In-Reply-To: <CALZ2gZX3LMTcJ11qg5T7RAJRGpcR3fE0YB2cWMbmXPzo3Vpqqg@mail.gmail.com>
References: <4F323C52.8030304@intel.com>
	<CDED78A957032E45B3239CDDA7642D1508437968@ORSMSX105.amr.corp.intel.com>
	<CALZ2gZX3LMTcJ11qg5T7RAJRGpcR3fE0YB2cWMbmXPzo3Vpqqg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Feb 2012 09:45:05 -0800
Message-ID: <CAMKF1spwxYzxRM2NbYfaU_GLXqjBtuXi5kO_Up6t2MS1zREi4g@mail.gmail.com>
To: "Osier-mixon, Jeffrey" <jeffrey.osier-mixon@intel.com>
Cc: Yocto Project Discussion <yocto@yoctoproject.org>, "Wold,
	Saul" <saul.wold@intel.com>, "Stewart,
	David C" <david.c.stewart@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 08 Feb 2012 17:53:39 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 8, 2012 at 9:34 AM, Osier-mixon, Jeffrey
<jeffrey.osier-mixon@intel.com> wrote:
> This sounds fantastic, and I'd love to create a page on the website
> reflecting this. Just so I am clear, what exactly is this 100% of? Do we
> have no local patches to upstream projects at all?

it means that all patches have a field 'Upstream-Status'
and for most of them it reflects the status of patch w.r.t. upstream
of given package


