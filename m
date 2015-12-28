Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0F48060616
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Dec 2015 19:03:58 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 28 Dec 2015 11:04:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,492,1444719600"; d="scan'208";a="20326997"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.169.103])
	by fmsmga004.fm.intel.com with ESMTP; 28 Dec 2015 11:03:56 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Dec 2015 08:03:54 +1300
Message-ID: <17919989.jSWpZWTNyU@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.2.8-300.fc23.x86_64; KDE/4.14.14; x86_64; ;
	)
In-Reply-To: <CAMKF1sr99S3k7ZqHY9jri42dCHgFB_BNs9FWu++9wmhHuxVWvw@mail.gmail.com>
References: <cover.1450756555.git.paul.eggleton@linux.intel.com>
	<CAMKF1sr99S3k7ZqHY9jri42dCHgFB_BNs9FWu++9wmhHuxVWvw@mail.gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/26] devtool/recipetool improvements
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
X-List-Received-Date: Mon, 28 Dec 2015 19:04:00 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wed, 23 Dec 2015 18:45:50 Khem Raj wrote:
> Can this series be backported to jethro as well ?
> most of them seems to be incremental changes
> hopefully not breaking backward compatibility in some
> unforseen ways

Some of it should be OK, but I'd be nervous about backporting the entire 
series. I'll prepare another jethro series soon (though I'm still waiting for 
my last set to be merged.)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

