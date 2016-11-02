Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 89A0471B45
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 02:45:16 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 01 Nov 2016 19:45:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,582,1473145200"; d="scan'208";a="1053835302"
Received: from kgonza2-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.158.24])
	by orsmga001.jf.intel.com with ESMTP; 01 Nov 2016 19:45:15 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Lukasz Nowak <lnowak.tyco@gmail.com>
Date: Wed, 02 Nov 2016 15:45:14 +1300
Message-ID: <1963082.u8LsCmP84d@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.7.9-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <a7611154-80b8-3a80-131a-9200ba4ccb34@gmail.com>
References: <c64cf308-d847-eac0-a2f7-bc8e686c2262@gmail.com>
	<CAJTo0LbR6gQYppuR6EPo30xnADd7-mfG6wg3Nf_r7a2-xgHgrw@mail.gmail.com>
	<a7611154-80b8-3a80-131a-9200ba4ccb34@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman: fix bad file descriptor initialisation
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
X-List-Received-Date: Wed, 02 Nov 2016 02:45:19 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tue, 01 Nov 2016 13:53:44 Lukasz Nowak wrote:
> It is a re-send. Apologies, but I have not received either of my two e-mails
> back from the mailing list, so I assumed the first one got stuck somewhere.
> I can see both of them in the web archive, though. Is that normal?
> 
> I've just checked and I have the "Receive your own posts to the list?"
> option set to Yes.

You should be receiving your own posts then. They aren't going into your spam 
folder by any chance?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

