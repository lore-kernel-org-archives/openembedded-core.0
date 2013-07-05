Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f49.google.com (mail-vb0-f49.google.com
	[209.85.212.49])
	by mail.openembedded.org (Postfix) with ESMTP id 338FC6AE2A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 13:07:21 +0000 (UTC)
Received: by mail-vb0-f49.google.com with SMTP id 12so1662797vbf.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Jul 2013 06:07:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=ZjFx8m7tqw4tVMHabZYfk0uLLXyM7byVxsz+bgjH1QE=;
	b=a3/oTO3SiVLBpoeACVrtLmnO6P32gTTZrTUSSkSnYK4aP2njAQ0N2O8FhmCr3Aboi+
	Uk9JSprbdBLuF1Ch8+8J5NqOqjn3kT/6AN6DkTbWO56N8TGpIUTuuiUcflVCUFSIFDcK
	p9z0dyhhgZxA57GNreYrINS1sQyTZ1cAd/UoD160bemGiSozT4KCGvR6SiKfL1Y4ObBn
	FAj36LX/NsgV0IKIlmvYxouGeSrGX9Q4APvQIdfvwe8XtflHl2EyoSqUxeRJzHLY/iF3
	p9kw8jRW3el1kwyufJ51KSNHDk0nH+ed02FleniBn/aJVxGant/EAtI+KEM1iAEeIPBy
	tIzg==
X-Received: by 10.220.58.195 with SMTP id i3mr6726718vch.38.1373029642064;
	Fri, 05 Jul 2013 06:07:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Fri, 5 Jul 2013 06:07:01 -0700 (PDT)
In-Reply-To: <320805d249fc97b23828981e8606c2ed0745a66e.1372952884.git.ionutx.radu@intel.com>
References: <cover.1372952884.git.ionutx.radu@intel.com>
	<320805d249fc97b23828981e8606c2ed0745a66e.1372952884.git.ionutx.radu@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 Jul 2013 14:07:01 +0100
Message-ID: <CAJTo0LaxCqsFZsuDOHTWERapVN_FCfOt=jcCi9xWav4pWAAKWg@mail.gmail.com>
To: Ionut Radu <ionutx.radu@intel.com>
X-Gm-Message-State: ALoCoQl9RujWrMAWaeUC0vQ3FPUD5fW2iz0hHMBwnbBl5Q9UT+DoYNn844zb/s6iZacPEz8hY9nQ
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 05/10] libsoup-2.4: Updated from 2.42.1 to 2.43.2
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
X-List-Received-Date: Fri, 05 Jul 2013 13:07:22 -0000
Content-Type: text/plain; charset=UTF-8

On 5 July 2013 08:10, Ionut Radu <ionutx.radu@intel.com> wrote:
> Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
> ---
>  .../libsoup/{libsoup-2.4_2.42.1.bb => libsoup-2.4_2.43.2.bb}       |    4 ++--

NAK.

libsoup is GNOME so this is a development release.

Ross

