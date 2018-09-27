Return-Path: <paul.eggleton@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5AAFC79906;
	Thu, 27 Sep 2018 23:34:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Sep 2018 16:34:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,312,1534834800"; d="scan'208";a="74454168"
Received: from yupengts-mobl.gar.corp.intel.com (HELO localhost.localdomain)
	([10.249.64.150])
	by fmsmga008.fm.intel.com with ESMTP; 27 Sep 2018 16:33:59 -0700
From: Paul Eggleton <paul.eggleton@intel.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Date: Fri, 28 Sep 2018 11:33:56 +1200
Message-ID: <1907640.U4zZL0Bqpb@localhost.localdomain>
Organization: Intel Corporation
In-Reply-To: <156dc277-4255-aaf3-cb9f-f25a4481189f@windriver.com>
References: <1721109.tuLG3TFsTU@localhost.localdomain>
	<CAP71WjzUkYnazb3VHzEHgEDHoRqKdOT89Waw_hAy6pRyh8=BNA@mail.gmail.com>
	<156dc277-4255-aaf3-cb9f-f25a4481189f@windriver.com>
MIME-Version: 1.0
Cc: yocto@yoctoproject.org,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] layers.openembedded.org upgraded
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
X-List-Received-Date: Thu, 27 Sep 2018 23:34:02 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Randy

On Friday, 28 September 2018 11:22:29 AM NZST Randy MacLeod wrote:
> On 09/27/2018 05:28 PM, Nicolas Dechesne wrote:
> > On Thu, Sep 27, 2018 at 10:43 PM Paul Eggleton <paul.eggleton@intel.com> wrote:
> >> I'm very happy to announce that we've finally been able to upgrade the layer
> >> index at http://layers.openembedded.org to the latest revision on master,
> >> incorporating quite a bit of work that's been going on for the past few
> >> months. Improvements now visible:
> 
> Nice new features, thanks!
> 
> The "Branch:" and "Filter layers" selection menus don't work
> for me when using Firefox 62.0 (64-bit) on Ubuntu-18.04.
> 
> Google Chrome Version 69.0.3497.100 (Official Build) (64-bit)
> works fine.

Hmm, I do my development with Firefox and I just checked - with Firefox
62.0 (64-bit) here on Fedora 28 both work. Do you perhaps have an add-on
enabled that might prevent these from working? I believe they both rely on
javascript (the filter dropdown definitely does).

Cheers,
Paul

-- 
Paul Eggleton
Intel Open Source Technology Centre



