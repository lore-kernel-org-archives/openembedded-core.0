Return-Path: <jdmason@kudzu.us>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id E31E57F97A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2019 16:10:20 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id z7so8283735wrl.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Dec 2019 08:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kudzu-us.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=MFB0taAlSkRDCeSxOAK7yjV1QxH96CVr2KWPeXEWOkc=;
	b=H77XQkwzisOBbwyM3zRfmZjjByR8AHvyBVlLg2EQTOVcVYB7xwX4PKFzrAVNQFe7hD
	fTqOfVGcIVSx0JWNYhgKiKj8o+Kzy+lDkAgIJxky2/OAPVTJVDtLs3mcXIgyNu3OXizk
	zeuQUA4cbBAFTPdNK7rVSVb4N3HvLwKQxpFCCgTE2M6Wqai7eJYbvm+9soU4AqwzRimT
	xYjLfYS0nIWMMKXIZZ1F+d5fCaAJZWDkMbdZnJOm2qMesOW2Op3HSVb4K7A8fa1NvXb9
	RztqneWWl/SsV9G3bcmJF34HYlFdRVii3nGQT7rQcBanWtlsRvvD3ZMzDC3nSGRsyzSc
	IRDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=MFB0taAlSkRDCeSxOAK7yjV1QxH96CVr2KWPeXEWOkc=;
	b=r+dscIA+jMw0YSUEPj62CuppM2FeFcMGvL99cmuyFLpQE47hfrGIIMI95rvUJRAj+D
	a1xL0bFO/16gMTrfkginwFOiVNyC/IdbAyjJd+KoZm2WLmSUSUlcxV60xnOBAo9UXxqm
	tV3FJnmy1UEKtBqwagcMq2lJpr9fmu+DBA34hm8sXq+iWPWH2KekjLKrYsn1qmJd33T8
	1mPaFdz1akfQ7doBIYxLORY3uhiaWkRRLiiInIf2xSmt4c0TFm6/I5ZwzrUYlPpBUZXW
	Wu3dHy0qgOYGUnmh9XRT+exRpczP4/Z/VisJ7JqFp2mnrDiDl7MPqKEdv3zhryDVQU8D
	+rMw==
X-Gm-Message-State: APjAAAVwpUJhUfSxizegLeWP14gV8in8jw2in8xHVPAZMGEN7/Oy7+1X
	hSzP805hJ6Hxh/5imBp3FW4tcjEpsNenMwDHTQ6EAQ==
X-Google-Smtp-Source: APXvYqyKTrY7FL4SpCxSo93oXHcO06KJZ3QB1FlNZ28SiZu7Jxbiy2ldACl7K32vSi7e7K2Cp1ck2lyD0KtJ5gPoHgc=
X-Received: by 2002:a5d:68cf:: with SMTP id p15mr16664925wrw.31.1575648621395; 
	Fri, 06 Dec 2019 08:10:21 -0800 (PST)
MIME-Version: 1.0
From: Jon Mason <jdmason@kudzu.us>
Date: Fri, 6 Dec 2019 11:10:10 -0500
Message-ID: <CAPoiz9ysfd7NogxVWL1ZYHGESDdpcHkCp5koMKOUfzK=rSOR=Q@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Yocto discussion list <yocto@yoctoproject.org>
Subject: OpenEmbedded Workshop at FOSDEM20 tickets
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
X-List-Received-Date: Fri, 06 Dec 2019 16:10:21 -0000
Content-Type: text/plain; charset="UTF-8"

We are happy to inform everyone that tickets to the inaugural
OpenEmbedded Workshop are now on sale.  Early bird tickets are
available for 1/3rd off regular price.  Also, we are offering a
"Supporter Ticket".  This is for those who are able to contribute more
to help support OpenEmbedded, and/or would like to see more events
similar to this in the future.
Both of these can be purchased at
https://pretix.eu/OpenEmbedded/oe-workshop-2020/

Get your tickets now, as we expect these to sellout quickly.  Also,
early bird pricing ends on December 31st.

Finally, there are still a few slots open for Speakers.  If you have a
talk you would like to give, go to
https://pretalx.com/oe-workshop-2020/cfp
CFP deadline is December 15th.

More information on the OpenEmbedded Workshop can be found at
https://pretalx.com/oe-workshop-2020/

Thank you,
The OpenEmbedded Board

