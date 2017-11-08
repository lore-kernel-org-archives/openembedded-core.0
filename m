Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id B7EA978210
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Nov 2017 13:30:23 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Nov 2017 05:30:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,364,1505804400"; d="scan'208";a="173697319"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 08 Nov 2017 05:30:23 -0800
To: Alistair Francis <alistair.francis@xilinx.com>,
	Randy MacLeod <randy.macleod@windriver.com>
References: <20171107001706.10052-1-alistair.francis@xilinx.com>
	<CAJTo0LYkCH6TNwGU27Av5-2UwpXZb7iogyM8ScQ_b6JA5jibFw@mail.gmail.com>
	<90db7b51-f472-ebb6-2f45-c2fc3720443c@linux.intel.com>
	<e59a944e-af2b-f734-bd9a-161684de59f6@windriver.com>
	<CAKmqyKNzioN2qzjyk767YWR2id3GzNMLtZUh5K9QQAHgyOh2Kw@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <9f145dac-3d74-aa6d-afee-447e97dcb3f6@linux.intel.com>
Date: Wed, 8 Nov 2017 15:30:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKNzioN2qzjyk767YWR2id3GzNMLtZUh5K9QQAHgyOh2Kw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glib-2.0: Update to glib 2.53.7
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
X-List-Received-Date: Wed, 08 Nov 2017 13:30:24 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/08/2017 01:43 AM, Alistair Francis wrote:

> I don't want to be the Glib maintainer unfortunately, I just had to
> test something with Glib 2.53.4+ and I figured I would send the patch
> once I got it working.

I just want to say that as a community project, Yocto is what you make 
it. If no one takes care of glib, then glib develops long-term issues 
(such as becoming severely out of date, or carrying disproportionate 
amount of custom patches, or being blacklisted for certain 
configurations, or...).

So we do greatly appreciate if Yocto users are able to take care of the 
pieces that are important for their work, even if those pieces are not 
directly related to delivering results for the employers :)


Alex

