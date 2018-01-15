Return-Path: <mac@mcrowe.com>
Received: from avasout06.plus.net (avasout06.plus.net [212.159.14.18])
	by mail.openembedded.org (Postfix) with ESMTP id AA0A8786A2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jan 2018 17:10:55 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by smtp with ESMTP
	id b8HberWUs8e42b8Hce98F2; Mon, 15 Jan 2018 17:10:56 +0000
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=do719Wo4 c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=kj9zAlcOel0A:10 a=RgaUWeydRksA:10 a=NEAV23lmAAAA:8
	a=tdtlfwklwAyKXdwi0SsA:9 a=CjuIK1q_8ugA:10 a=7Je5IP05oHIA:10
Received: from mac by deneb with local (Exim 4.89)
	(envelope-from <mac@mcrowe.com>)
	id 1eb8Hb-0001w8-2Y; Mon, 15 Jan 2018 17:10:51 +0000
Date: Mon, 15 Jan 2018 17:10:51 +0000
From: Mike Crowe <mac@mcrowe.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20180115171051.wn43rrbutld4b4ku@mcrowe.com>
References: <20180115152254.447-1-mac@mcrowe.com>
	<a7be2ded-586e-b5a4-c2b1-62580356cbaa@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <a7be2ded-586e-b5a4-c2b1-62580356cbaa@linux.intel.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CMAE-Envelope: MS4wfAUttP7Y339m2YpN953/TctstilbF0/u9lH7nkX9pTcMmmVu0Oj4SWyau6grh/3KMeDytwRqEF2MKXfVLHOQ7Kwa3x7oLg2mP+LVPBbvP29QA4xeQPCP
	+g1melr12S7Xt9SlU+IheEPhVTf+Y6F29ZATZWeepk4CFmawPtelnSsb
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] rpm: backport configure fix for multiple users/groups with ID 0
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
X-List-Received-Date: Mon, 15 Jan 2018 17:10:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Monday 15 January 2018 at 17:27:19 +0200, Alexander Kanavin wrote:
> On 01/15/2018 05:22 PM, Mike Crowe wrote:
> > +Upstream-Status: Backport [https://github.com/rpm-software-management/rpm/pull/377]
> 
> If this is merged by upstream, you should point to the commit. If you merely
> made a submission, then the status should say Submitted.

The fix was merged. I used the pull request URL because it was shorter, but
I will change it to the commit URL instead.

Thanks.

Mike.

