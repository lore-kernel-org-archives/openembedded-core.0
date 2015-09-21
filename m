Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id BB7A160053
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 16:05:59 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 21 Sep 2015 09:02:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,568,1437462000"; d="scan'208";a="773654486"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 21 Sep 2015 09:01:09 -0700
Message-ID: <560029CB.6050006@linux.intel.com>
Date: Mon, 21 Sep 2015 19:01:15 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1442844096-27847-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1442844096-27847-1-git-send-email-Martin.Jansa@gmail.com>
Subject: Re: [PATCH] webkitgtk: add REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Mon, 21 Sep 2015 16:06:00 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 09/21/2015 05:01 PM, Martin Jansa wrote:
> * original webkit-gtk_1.8.3.bb recipe already had this, I don't know
>    why it was removed when upgrading to 2.8.5

It was removed because I couldn't figure out why it's actually needed. 
What is the scenario?

Regards,
Alex

