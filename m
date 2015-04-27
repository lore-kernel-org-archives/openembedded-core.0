Return-Path: <scerveau@connected-labs.com>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 8AFF973D53
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 15:41:39 +0000 (UTC)
Received: by wgyo15 with SMTP id o15so120484532wgy.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 08:41:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:message-id:date:from:user-agent
	:mime-version:to:subject:content-type:content-transfer-encoding;
	bh=g+tGwsLZwJV02Xjkhw9ynQIh/MO9IZH77eX6QRErco8=;
	b=eZh0LvZSJfUaFjpp5jix5i3zCfd0HIkL9NOmeUI6UkXMFVLEcvGNXW8qAovxWvsVnf
	W+ucpHSKaJ/fdOFC3mjCwBG3BSAzIAzdNrPOK9OIs0SyYNQrDZzbq8sQkhgPxMFgWnFF
	xQMGOtRLQ/EW3+xE7/MPrkThPeOOhpMcm6/bnYmGccXnvFh67kNtblxQCabEw6Ro1EWl
	c6/AsJHPm1x0HUTeLKUSkoXHbSWxOoH9JQCVS6+GUsTl3cgHmo8ra5wmoL6oScid+DxM
	3ZiH+xwwUwzAt/u4AhAm1nc9+TqbCI0vQy0saG1RSZuIT5MMnFcY3H65OFp3O50VpKJ0
	xIIQ==
X-Gm-Message-State: ALoCoQlHvYKRGoX50URi/ARptmDzsSgbf+1w8S7gELXikqbRNJRjn6omQSh082+MCcKlM6mgbyVB
X-Received: by 10.195.11.202 with SMTP id ek10mr23157589wjd.12.1430149300680; 
	Mon, 27 Apr 2015 08:41:40 -0700 (PDT)
Received: from [172.24.63.26]
	(connected-labs-gw1.ter2.neodc.mpl.cust.as8218.eu. [94.103.137.126])
	by mx.google.com with ESMTPSA id l1sm12124404wiy.20.2015.04.27.08.41.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Apr 2015 08:41:40 -0700 (PDT)
Sender: Stephane Cerveau <scerveau@connected-labs.com>
Message-ID: <553E58AC.40002@voxtok.com>
Date: Mon, 27 Apr 2015 17:41:32 +0200
From: scerveau <scerveau@voxtok.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Mariadb 5.5.39 can not be downloaded anymore.
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
X-List-Received-Date: Mon, 27 Apr 2015 15:41:40 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

This url answers with 404 status:

http://mirror.stshosting.co.uk/mariadb/mariadb-5.5.39/source/mariadb-5.5.39.tar.gz

Shall we update the recipe or wait for the server to be up ?

-- 
Stéphane Cerveau
Tech Lead Audio
Voxtok Technologies
04 34 40 82 43
www.voxtok.com


