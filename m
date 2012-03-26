Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SCEzA-0004QX-Cv
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 20:49:44 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 26 Mar 2012 11:40:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="125298436"
Received: from unknown (HELO envy.home) ([10.7.199.147])
	by orsmga002.jf.intel.com with ESMTP; 26 Mar 2012 11:40:41 -0700
Message-ID: <4F70B7FE.8080002@linux.intel.com>
Date: Mon, 26 Mar 2012 11:39:58 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120209 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1332524132-24689-1-git-send-email-trini@ti.com>
	<1332753313.28414.91.camel@ted>
	<20120326162531.GD21518@bill-the-cat>
	<1332780976.28414.130.camel@ted>
	<20120326171359.GE21518@bill-the-cat>
In-Reply-To: <20120326171359.GE21518@bill-the-cat>
X-Enigmail-Version: 1.4
Cc: Scott Rifenbark <srifenbark@gmail.com>
Subject: Re: [PATCH] qemu.inc: Use '=' for IMAGE_FSTYPES
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
X-List-Received-Date: Mon, 26 Mar 2012 18:49:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 03/26/2012 10:13 AM, Tom Rini wrote:

> 
> I think for the upcoming release, =+ is good enough and we can talk
> about adding further variables after if it's still too complicated.  So,
> now where's the repo that documenting these examples should go in?
> 

You want to talk to Scott Rifenbark, on CC.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


