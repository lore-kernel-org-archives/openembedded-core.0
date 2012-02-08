Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Rv4ao-0005hh-22
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Feb 2012 11:17:38 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 08 Feb 2012 02:09:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="122434019"
Received: from unknown (HELO helios.localnet) ([10.252.123.18])
	by fmsmga002.fm.intel.com with ESMTP; 08 Feb 2012 02:09:33 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Samuel Stirtzel <s.stirtzel@googlemail.com>
Date: Wed, 08 Feb 2012 10:09:32 +0000
Message-ID: <2211037.GJWb2du2Sd@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-15-generic-pae; KDE/4.8.0; i686; ; )
In-Reply-To: <CAGiJk9f9Mc06KbPVBcTFi_icr=P3ZGuBYrDT7oH+gC5dKVKpbA@mail.gmail.com>
References: <CAGiJk9f9Mc06KbPVBcTFi_icr=P3ZGuBYrDT7oH+gC5dKVKpbA@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: RFC: Porting KDE Plasma Active (WIP)
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
X-List-Received-Date: Wed, 08 Feb 2012 10:17:38 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Samuel,

On Thursday 02 February 2012 12:50:16 Samuel Stirtzel wrote:
> for some time now I've been working on a port of Plasma Active, the
> next generation touch user interface from KDE.

This is something I'd been wanting to do as well. I got as far as being able 
to build cleaned up versions of the KDE recipes we had in OE-Classic (not very 
many) but that was it. Looks like you're doing really well!

FYI You may find the KDE / Plasma Active packages in Meego to be a useful 
reference if you still have gaps/issues to solve:

https://build.pub.meego.com/project/monitor?project=Project%3AKDE%3ATrunk

I will try to test out your layer over the next week or so and let you know 
how I get on.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


