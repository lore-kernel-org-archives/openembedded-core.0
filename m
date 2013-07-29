Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 97A6A6B436
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 15:49:52 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 29 Jul 2013 08:49:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,770,1367996400"; d="scan'208";a="377855615"
Received: from unknown (HELO helios.localnet) ([10.252.122.206])
	by fmsmga002.fm.intel.com with ESMTP; 29 Jul 2013 08:49:52 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jul 2013 16:49:51 +0100
Message-ID: <6339709.CFmXEXRQnE@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-26-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <cover.1375110365.git.sgw@linux.intel.com>
References: <cover.1375110365.git.sgw@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [CONSOLIDATED PULL (Part 2) (resend) 00/26] Branch Updated with Correct Set
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
X-List-Received-Date: Mon, 29 Jul 2013 15:49:52 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 29 July 2013 08:07:51 Saul Wold wrote:
> Branch is updated, sorry not sure what happened with the
> obex and texinfo, I thought I had removed them since they did not
> show up in the summary below (in the first email).
> 
> Already basicly ACK'ed by Ross and Paul
> 
> Thanks
> Sau!
> 
> The following changes since commit 09deeef20ee5a0c12ad4fd89cace6e0fb832d5b1:
> 
>   external-sourcery: add missing providers (2013-07-27 23:28:29 -0700)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage2
>  
> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/
> stage2
> 
> Andrei Dinu (1):
>   libpng : upgrade to 1.6.3
> 
> Emilia Ciobanu (14):
>   babeltrace: fix recipe name
>   build-appliance-image: fix recipe name add GIT revision to PV variable
>   chkconfig-alternatives-native: fix recipe name and add GIT revision to
>     PV variable
>   connman-gnome: fix recipe name add GIT revision to PV variable
>   docbook-sgml-dtd-3.1-native: fix recipe name
>   docbook-sgml-dtd-4.1-native: fix recipe name
>   hwlatdetect: fix recipe name and add GIT revision to PV variable
>   lttng-ust: fix recipe name and add GIT revision to PV variable
>   mtd-utils: fix recipe name and add GIT revision to PV variable
>   neard: fix recipe name
>   rt-tests: fix recipe name add GIT revision to PV variable
>   update-rc.d: fix recipe name and add GIT revision to PV variable

Some of these patches were meant to be dropped... so no ack from me.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

