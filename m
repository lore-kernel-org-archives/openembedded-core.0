Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 08CA96C99C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2013 09:41:52 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 20 Sep 2013 02:41:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,943,1371106800"; d="scan'208";a="363224232"
Received: from unknown (HELO helios.localnet) ([10.252.123.234])
	by azsmga001.ch.intel.com with ESMTP; 20 Sep 2013 02:41:54 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Sep 2013 10:41:53 +0100
Message-ID: <10866430.oefqsT3cHg@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-30-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <ceb65c408a19ce7c1b5223b5a3029a0ebfb39a9b.1379669217.git.paul.eggleton@linux.intel.com>
References: <cover.1379669217.git.paul.eggleton@linux.intel.com>
	<ceb65c408a19ce7c1b5223b5a3029a0ebfb39a9b.1379669217.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH 2/5] classes/testimage-auto: add class to allow automatically running image tests
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
X-List-Received-Date: Fri, 20 Sep 2013 09:41:54 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 20 September 2013 10:27:50 Paul Eggleton wrote:
> +do_testimage_auto[nostamp] = "1"

Oops, this is erroneous; I have removed it on the branch.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

