Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f54.google.com (mail-vb0-f54.google.com
	[209.85.212.54])
	by mail.openembedded.org (Postfix) with ESMTP id 52A836B1EC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 14:26:03 +0000 (UTC)
Received: by mail-vb0-f54.google.com with SMTP id q12so2413090vbe.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 07:26:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=cjq5AUTAoJtyaLVFSfE1ho2CGIjtkiJ5urFkLVfSrK8=;
	b=LkC4GxHi2V6iE1uvCZO/KTw7SZSpmEvPx/RFpAyZhJVpvuLl0LwtxxZAp4njZUnABw
	wYWaRiAnU5Bw7OyuJ8GYkvSPYblaofoCrpwHycsQR9NQun8KeTByUOovT6ONYeO9Hna/
	Y1GrK5A8OEDzZOSikZVhjSDT9S3rd11sh8p/iOwHl/nf24tZA6RJaDmXetxm86MvJ4Ij
	oW0iZStszeXkAv/ZJOclhgev3Z7vRpdIu6Pz6A2IygiQPBAbkrcq5BcShDnNynZV5Zqn
	Ngir7r523pEMF5FqlifG/yHLimeXT/fDzuu1uuFHh8kx+9NeLx2Dq33iZS1xQdJmYgAe
	Q3JQ==
X-Received: by 10.220.1.9 with SMTP id 9mr4169569vcd.37.1374157563723; Thu, 18
	Jul 2013 07:26:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 18 Jul 2013 07:25:43 -0700 (PDT)
In-Reply-To: <cover.1374157000.git.sgw@linux.intel.com>
References: <cover.1374157000.git.sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 18 Jul 2013 15:25:43 +0100
Message-ID: <CAJTo0LYVy6ogJsHhRfxp8gH=ys8y2qo6SB3+e_Bzb-YwODb=SA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQk3PmSNJxKzHX3kX6fiaKhmIakjvuq/GvjkdF0jxT4htSoUmbEmzCNp15SXpjlB1ht8QMT3
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/36] Updated and Ready
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
X-List-Received-Date: Thu, 18 Jul 2013 14:26:03 -0000
Content-Type: text/plain; charset=UTF-8

On 18 July 2013 15:24, Saul Wold <sgw@linux.intel.com> wrote:
> The following changes since commit cf1790d992f067be8d5f9894458f55f6f1bdc61f:
>
>   lib/oeqa: fix dependecy check (2013-07-15 10:29:27 -0700)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Acked-By: Ross Burton <ross.burton@intel.com>

