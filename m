Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Tyo3x-0003Ub-6g
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 19:31:41 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 25 Jan 2013 10:14:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,540,1355126400"; d="scan'208";a="276687172"
Received: from unknown (HELO helios.localnet) ([10.252.123.155])
	by orsmga002.jf.intel.com with ESMTP; 25 Jan 2013 10:16:05 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Ross Burton <ross.burton@intel.com>
Date: Fri, 25 Jan 2013 18:16:03 +0000
Message-ID: <21577255.rquHYp0Wn6@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.4 (Linux/3.5.0-22-generic; KDE/4.9.4; i686; ; )
In-Reply-To: <1359135782-8953-1-git-send-email-ross.burton@intel.com>
References: <1359135782-8953-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] scripts/wipe-sysroot: add script to safely wipe the sysroots
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
X-List-Received-Date: Fri, 25 Jan 2013 18:31:41 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 25 January 2013 17:43:02 Ross Burton wrote:
> Add a script to wipe the sysroots and all of the relevant stamps, so that it
> will be correctly re-populated.

What I'm missing from this and/or the script header is when you would need to 
do this... ?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


