Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 4C0D37659C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 13:03:55 +0000 (UTC)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.1/8.15.1) with ESMTPS id t6VD3ljf019449
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Fri, 31 Jul 2015 15:03:47 +0200
Received: from [139.22.116.63] (md1g632c.ww300.siemens.net [139.22.116.63])
	by mail1.sbs.de (8.15.1/8.15.1) with SMTP id t6VD3kdO017486;
	Fri, 31 Jul 2015 15:03:46 +0200
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	"Burton, Ross" <ross.burton@intel.com>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
	<86b43671f02c22f328e3801e0711a33731156ba8.1438262915.git.alexander.kanavin@linux.intel.com>
	<20150730143658.GK2457@jama> <55BA4399.2030302@linux.intel.com>
	<CAJTo0LajDS9QaEdczNG9OnpkQWj_B148+TSwKwNCxXLyk9xnjA@mail.gmail.com>
	<55BA524A.1070904@linux.intel.com> <55BB6CA7.2060908@siemens.com>
	<55BB6FC3.5060605@linux.intel.com>
From: Pascal Bach <pascal.bach@siemens.com>
Message-ID: <55BB7232.10705@siemens.com>
Date: Fri, 31 Jul 2015 15:03:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <55BB6FC3.5060605@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 21/26] systemd: remove PV from the recipe
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
X-List-Received-Date: Fri, 31 Jul 2015 13:03:57 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit


> The idea behind systemd-stable repository is described here:
> http://www.freedesktop.org/wiki/Software/systemd/Backports/
>
Thanks I didn't know that.

> However, it hasn't received any new commits since early May, and still stuck at v219, so should we update to a new version from the main repository? What's oe-core policy here?
>
Not sure what would be the right appreoach, I would also be interested to hear the policy of oe-core for this.

Pascal

