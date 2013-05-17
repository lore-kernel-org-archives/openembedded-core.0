Received: from mail-vb0-f54.google.com ([209.85.212.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UdLzh-0005SV-U5
	for openembedded-core@lists.openembedded.org;
	Fri, 17 May 2013 16:50:57 +0200
Received: by mail-vb0-f54.google.com with SMTP id f12so2326147vbg.27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2013 07:32:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=dHoc6GIgIbN706MUdBy4qzlrrxAB7JONRNt/kfsSPx8=;
	b=nE1lSWSxiEJhlTsZX/pg7Ln2P6rcSe22W9Jnq6kh66Z+77KR2XUWXUNw1fnBiaArDt
	IaYuqItgcVAKuIgt1Cl30PW1KXpyoiu9aXWRNz6s/ISYFcPCVe6pzmCCBjCmSUbMkzgd
	BwIDzXETv8qCnJXZZ5dDmsjgqM6215FsjKSaBcUVBjIVrUNynpqxkUWbAeL1UioTLLII
	dNe5O52XY/t+jEDf4lBVDQRWUzCAwJxCkSbgd5JHcDpXtYM+X24nvD8I3Fwp452qhmgr
	KX87VLr6Q4NgS26epDF8qS9C6FyKWESfZ2PuFZ4XwcKjSvLsI++Af91ctssn5UklaQG8
	L05A==
X-Received: by 10.220.155.8 with SMTP id q8mr29887011vcw.42.1368801156207;
	Fri, 17 May 2013 07:32:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Fri, 17 May 2013 07:32:15 -0700 (PDT)
In-Reply-To: <51963D78.8010908@mlbassoc.com>
References: <51962FFE.3040202@mlbassoc.com> <51963C52.1040004@linux.intel.com>
	<51963D78.8010908@mlbassoc.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 17 May 2013 15:32:15 +0100
Message-ID: <CAJTo0La=GUsgnsxw0QLT4OhgDkqFYTte4cRvYtrCsKfF9D1kJg@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
X-Gm-Message-State: ALoCoQn2FhZkQaT1IiRZ30p8Mt2N19H7Ab3h6c64Pm5wLTKJhUJxWqMXwY/8MjcASGGTiRXZqKiv
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Poor first impression
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 May 2013 14:50:57 -0000
Content-Type: text/plain; charset=UTF-8

On 17 May 2013 15:23, Gary Thomas <gary@mlbassoc.com> wrote:
> Master, updated 2013-05-16

Definitely worth updating again, there were some incompatibility with
Python 2.6 that were fixed yesterday.

Ross


