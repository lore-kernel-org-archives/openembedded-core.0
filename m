Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1A9CA71637
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 May 2015 14:15:04 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 May 2015 07:13:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,421,1427785200"; d="scan'208";a="694311932"
Received: from drogers-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.14.115])
	by orsmga001.jf.intel.com with ESMTP; 13 May 2015 07:13:48 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Mario Domenech Goulart <mario@ossystems.com.br>
Date: Wed, 13 May 2015 15:13:47 +0100
Message-ID: <119296179.kQq9gGWn8B@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.7 (Linux/3.19.5-200.fc21.x86_64; KDE/4.14.7; x86_64; ; )
In-Reply-To: <873830tylr.fsf@email.parenteses.org>
References: <1431442688-5860-1-git-send-email-mario@ossystems.com.br>
	<6951375.nXgDNRerCy@peggleto-mobl.ger.corp.intel.com>
	<873830tylr.fsf@email.parenteses.org>
MIME-Version: 1.0
Cc: Anders Darander <anders@chargestorm.se>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] README: add "Contributing" section
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
X-List-Received-Date: Wed, 13 May 2015 14:15:07 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 13 May 2015 13:07:28 Mario Domenech Goulart wrote:
> On Wed, 13 May 2015 09:54:39 +0100 Paul Eggleton 
<paul.eggleton@linux.intel.com> wrote:
> > On Wednesday 13 May 2015 07:17:01 Anders Darander wrote:
> >> * Mario Domenech Goulart <mario@ossystems.com.br> [150512 16:58]:
> >> > +Contributing
> >> > +------------
> >> > +
> >> > +To contribute to this layer you should submit the patches for
> >> > +review to the mailing list (openembedded-core@lists.openembedded.org).
> >> > +
> >> > +Please refer to:
> >> > +http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> >> > +for some useful guidelines to be followed when submitting patches.
> >> > +
> >> > +Mailing list:
> >> > +
> >> > +    http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >> > +
> >> > +Source code:
> >> > +
> >> > +    http://git.openembedded.org/openembedded-core/
> >> > +
> >> > +When sending patches, please use something like:
> >> > +
> >> > +    git send-email --to openembedded-core@lists.openembedded.org
> >> > <patches>
> >> 
> >> Maybe we could add something about the helper scripts:
> >> 
> >> scripts/create-pull-request
> >> scripts/send-pull-request
> >> 
> >> or do you think that those scripts might be out of scope for the primary
> >> intended audience of this section?
> > 
> > My suggestion would be to link to the following page instead which covers
> > all> 
> > the options and explains how to use them:
> >   http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
> > 
> > We can probably drop the "commit message guidelines" link at the same time
> > since the above page already links to that.
> 
> Thanks guys for the suggestions.
> 
> Paul: do you mean dropping everything and add something like
> 
> 
> Contributing
> ------------
> 
> Please refer to
> http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
> for guidelines on how to submit patches.
> 
> 
> ?  Or keep everything and just replace the guidelines link?

I think the best plan would be to 1) edit the contributing section as you 
posted above, and 2) drop the "When sending patches..." bit.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

