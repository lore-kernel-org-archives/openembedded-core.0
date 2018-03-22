Return-Path: <anuj.mittal@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id C929C7806D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 06:37:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Mar 2018 23:37:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,343,1517904000"; d="scan'208";a="27034514"
Received: from anmitta2-mobl1.png.intel.com (HELO [10.221.20.224])
	([10.221.20.224])
	by orsmga007.jf.intel.com with ESMTP; 21 Mar 2018 23:37:18 -0700
To: Rajath C S <rajathcs.1996@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
References: <CAPGMVzE+s2x_3LE1q+j+ovb4JoBrX4TCLjwf4cyyLyUxAXgSMg@mail.gmail.com>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <518278bc-ebcf-8ae9-bd8e-535bf45f2fdc@intel.com>
Date: Thu, 22 Mar 2018 14:37:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAPGMVzE+s2x_3LE1q+j+ovb4JoBrX4TCLjwf4cyyLyUxAXgSMg@mail.gmail.com>
Subject: Re: devtool add query
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
X-List-Received-Date: Thu, 22 Mar 2018 06:37:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 03/22/2018 02:26 PM, Rajath C S wrote:
> hello all,
> 
> i am working on devtool and when i use 'devtool add' followed by the
> url, can  this URL be a github repo because from the video source i was
> learning dev tools the person teaching had added a tar.gz URL only; i
> wanted to know if this URL can be a github repo too..??

One easy way to find out is to try it out :)

devtool add <recipe_name> <URI>

Please refer to the manual for detailed explanation on the options
available:

https://www.yoctoproject.org/docs/latest/ref-manual/ref-manual.html#ref-devtool-reference

And to this page for some FAQs:

https://wiki.yoctoproject.org/wiki/Technical_FAQ

> Thanks
> 
> 


