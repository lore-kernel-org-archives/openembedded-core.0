Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 41C4178409
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 18:05:40 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Jun 2017 11:05:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,344,1493708400"; d="scan'208";a="98370477"
Received: from scetola-mac01.jf.intel.com (HELO
	ptan20-mobl.gar.corp.intel.com) ([10.54.74.147])
	by orsmga004.jf.intel.com with ESMTP; 15 Jun 2017 11:05:41 -0700
Date: Thu, 15 Jun 2017 11:05:42 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: "Zeeshan Ali (Khattak)" <zeeshanak@gnome.org>
Message-ID: <20170615180542.GA16912@ptan20-mobl.gar.corp.intel.com>
References: <20170529060935.8093-1-erik.boto@pelagicore.com>
	<20170529060935.8093-2-erik.boto@pelagicore.com>
	<CAAa3hFMMxVRMRNufBenQ7E1G3stW0Xvu8xeE94MPfOa-J35axA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAa3hFMMxVRMRNufBenQ7E1G3stW0Xvu8xeE94MPfOa-J35axA@mail.gmail.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
Cc: Leonardo Sandoval Gonzalez <leonardo.sandoval.gonzalez@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/4] masterimage.py: fix issue with calling reboot on masterimage/DUT
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
X-List-Received-Date: Thu, 15 Jun 2017 18:05:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 06/15, Zeeshan Ali (Khattak) wrote:
> Hi,
> 
> Has this been already merged? I ask cause there is a small change
> needed for large-enough rootfs:
> 
This has not been merged yet.

Erik, could you please send a V3?

When you do so, please reference the bug in the commit messages like this:

[YOCTO #11524]

Thanks!

Cheers,
Stephano

