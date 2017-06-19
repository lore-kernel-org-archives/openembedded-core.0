Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B041471A84
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 14:23:51 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Jun 2017 07:23:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,361,1493708400"; d="scan'208";a="116682178"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 19 Jun 2017 07:23:51 -0700
To: "Burton, Ross" <ross.burton@intel.com>,
	Gabriel Ionescu <gabriel.ionescu@enea.com>
References: <1497872882-15011-1-git-send-email-gabriel.ionescu@enea.com>
	<CAJTo0LaEb+bZ5fmCqy-CjNb3GyKm_xYem3y_92ziK_N4Ya8K-A@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <0b2a7586-6f12-da7f-5d29-8caecc71e5e0@linux.intel.com>
Date: Mon, 19 Jun 2017 17:21:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaEb+bZ5fmCqy-CjNb3GyKm_xYem3y_92ziK_N4Ya8K-A@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [pyro][PATCH] autogen-native: Set POSIX_SHELL to /bin/sh
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
X-List-Received-Date: Mon, 19 Jun 2017 14:23:52 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 06/19/2017 05:19 PM, Burton, Ross wrote:
> Why pyro and not master?

I sent a patch to remove autogen from master the other day :)

Alex


