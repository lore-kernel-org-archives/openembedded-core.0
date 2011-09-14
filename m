Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1R3s53-0005OY-ND
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 18:12:57 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 14 Sep 2011 09:07:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,381,1312182000"; d="scan'208";a="51279864"
Received: from unknown (HELO [10.255.14.200]) ([10.255.14.200])
	by fmsmga001.fm.intel.com with ESMTP; 14 Sep 2011 09:07:46 -0700
From: Tom Zanussi <tom.zanussi@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CAP9ODKpkWUs+7QspzHAMHS5JBDuO_HP93wmX5LoiSAckpnNHsg@mail.gmail.com>
References: <1315978760.26879.1858.camel@elmorro>
	<CAP9ODKrn8ZZZFFZPwuMU-Jto5X9On3A5p8wKeEU7ZcQAa9GoHg@mail.gmail.com>
	<1316015141.26879.2469.camel@elmorro>
	<CAP9ODKpsEx=05bVBVYvxLhuDfb=14gdZ2KaERrWCkHQYQOfHpQ@mail.gmail.com>
	<1316016075.26879.2487.camel@elmorro>
	<CAP9ODKpkWUs+7QspzHAMHS5JBDuO_HP93wmX5LoiSAckpnNHsg@mail.gmail.com>
Date: Wed, 14 Sep 2011 11:07:37 -0500
Message-ID: <1316016457.26879.2494.camel@elmorro>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Subject: Re: [PATCH 0/2] Add new recipes for grub2
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
X-List-Received-Date: Wed, 14 Sep 2011 16:12:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-09-14 at 09:05 -0700, Otavio Salvador wrote:
> On Wed, Sep 14, 2011 at 13:01, Tom Zanussi <tom.zanussi@intel.com> wrote:
> > Well, my new version handles both grub 0.97 and grub2.  We need to keep
> > grub 0.97 around because grub2 is GPLv3.
> 
> Sure; fully agree on that but we can get rid of two different scripts
> and avoid duplicated maintainence work :-)
> 

Definitely - my new patch does that - I'll post it in a few minutes...

Tom



