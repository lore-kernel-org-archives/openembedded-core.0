Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 90F5A606D0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 10:45:52 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 12 Jul 2016 03:45:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,351,1464678000"; d="scan'208";a="993572102"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 12 Jul 2016 03:45:53 -0700
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
References: <cover.1467905611.git.jussi.kukkonen@intel.com>
	<b0ba31b71ad1e9d540ab007713fe034a3bc1f7d1.1467905611.git.jussi.kukkonen@intel.com>
	<CAJTo0LZ67c7MXQrsBYzK6c+dQ3DGq0Xp5To+pz64qo=Cu8qeKQ@mail.gmail.com>
	<CAHiDW_G_NZWhoq-Grt=jjpc4H+pkkuOdbGL7kf5Omho1dLhNFA@mail.gmail.com>
	<71487947-2b12-ecb8-110f-be7002efb8d4@linux.intel.com>
	<CAHiDW_EGQ3d1ndn3HjJqU4EmVrYVMyG+Ouk6d2miT_qW02pasA@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <3d7bedc4-c205-192c-f5e1-03f684d532ad@linux.intel.com>
Date: Tue, 12 Jul 2016 13:45:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <CAHiDW_EGQ3d1ndn3HjJqU4EmVrYVMyG+Ouk6d2miT_qW02pasA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] python-six: Add to oe-core
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
X-List-Received-Date: Tue, 12 Jul 2016 10:45:54 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/12/2016 01:38 PM, Jussi Kukkonen wrote:
> Interestingly  python-cryptography does not have six in "setup_requires"
> so I still don't understand why it would do this. I'll do a few tests on
> that before sending the updated patch set.

Maybe it simply used to have that in the past, and no longer does.


Alex


