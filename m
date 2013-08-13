Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f179.google.com (mail-vc0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 4EE5861037
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 18:10:31 +0000 (UTC)
Received: by mail-vc0-f179.google.com with SMTP id ht10so4154414vcb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 11:10:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=tXPrns0bLga/8fwXvPzjykKPL2xTCvCHFDZ6Z6ijlaw=;
	b=a/6LgvwDvuTlT0wpRvrPXOvtg+0VZDb7icnoc/8hUCjV6dg/ZrmWzhRA+S+iK64b4r
	jiLPeM5a73dogpMH0b5D3bSbkom1R8bYMRtfyr+xseS6knJc/xeFJ93Qa7SkQ2Pzv3fY
	V18QqM5IUCrbPhLPddrvGA8EVe1jd2hsDPR1afVc5qPT7kpQQBtcebkICYhGX4PJPsCX
	kGhDdH+W3A87HMnq2LxidryyyxEu5gNuoC3i4jKeHR0XWayd+GnBAKRLsavQFOuf6IQD
	Uo9AheWUnR4MU2Vl1AZBVWqzXHLm24IZYSI6gkgJGbke1Y2XEm2hq1pyrLPBGatrbN7h
	DKiA==
X-Gm-Message-State: ALoCoQm5fhvpk7DDTkv/9ho95rrv9AuHe/CMp5kqiMWvij1hiKse6TuGjRzdr4hWqm1h+XtU/m8c
X-Received: by 10.52.89.197 with SMTP id bq5mr44487vdb.65.1376417431431; Tue,
	13 Aug 2013 11:10:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 13 Aug 2013 11:10:11 -0700 (PDT)
In-Reply-To: <cover.1376414097.git.sgw@linux.intel.com>
References: <cover.1376414097.git.sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 13 Aug 2013 19:10:11 +0100
Message-ID: <CAJTo0LbstOp2RwCgmF3pKUTOqSB1vGYw-BpULufaoEXBud5PdA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/24] Final Review & ACK
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
X-List-Received-Date: Tue, 13 Aug 2013 18:10:31 -0000
Content-Type: text/plain; charset=UTF-8

On 13 August 2013 18:49, Saul Wold <sgw@linux.intel.com> wrote:
> Richard:
>
> This will be ready to pull after Paul and Ross Ack.
>
> I fixed the groff patches for GPLv2 and updated Stefan's patch,
> other than that no changes.

Acked-By: Ross Burton <ross.burton@intel.com>

Ross

