Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 14FE665D59
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Sep 2014 09:48:28 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 26 Sep 2014 02:48:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,603,1406617200"; d="scan'208";a="605743933"
Received: from tmediriw-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.182])
	by fmsmga002.fm.intel.com with ESMTP; 26 Sep 2014 02:48:28 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 Sep 2014 10:48:26 +0100
Message-ID: <2909105.7rXnUHlh5T@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.1 (Linux/3.16.3-200.fc20.x86_64; KDE/4.14.1; x86_64; ; )
In-Reply-To: <CAJTo0LbUPQfspN5yet6XvQziSk-pDqDHf0GvhCi06xn3CohUJg@mail.gmail.com>
References: <1411686803-13274-1-git-send-email-ross.burton@intel.com>
	<9C24F433-394B-4682-B921-7BD865351E64@dominion.thruhere.net>
	<CAJTo0LbUPQfspN5yet6XvQziSk-pDqDHf0GvhCi06xn3CohUJg@mail.gmail.com>
MIME-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] curl: add a PACKAGECONFIG for librtmp
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
X-List-Received-Date: Fri, 26 Sep 2014 09:48:36 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 26 September 2014 10:43:26 Burton, Ross wrote:
> On 26 September 2014 07:55, Koen Kooi <koen@dominion.thruhere.net> wrote:
> > Using librtmp has nasty legal consequences in various countries, is there
> > a way to express that risk? Something analogous to the commercial license
> > protection we have.
>
> Agreed, but wouldn't that be something done in the rtmpdump recipe?

Actually that would make more sense than what I suggested, yes.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

